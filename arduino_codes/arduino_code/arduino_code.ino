
#include <Wire.h>

const int current_1=A0;
const int current_2=A1;
const int current_3=A2;
const int current_4=A3;
const int battery_v0=A4;
const int battery_va=A5;
const int battery_vb=A6;
const int trigPin = 12;
const int echoPin = 13;
const int motor_1=5;
const int motor_2=6;
const int motor_3=9;
const int motor_4=10;
float data[6];
float motor[4];
int z=0;
int d=0;
long duration;
float distance;
//resistance for battery circuit

float r1 = 1000;
float r2 = 1000;
float r3 = 2000;
float r4 = 1000;
void setup() {
  Wire.begin(0x40);                // join i2c bus with address #40
  Wire.onReceive(receiveEvent);
  Wire.onRequest(sendData);               // register event
  Serial.begin(9600);  
  pinMode(trigPin, OUTPUT); 
  pinMode(echoPin, INPUT);
  pinMode(motor_1,OUTPUT);
  pinMode(motor_2,OUTPUT);
  pinMode(motor_3,OUTPUT);
  pinMode(motor_4,OUTPUT);
}

void loop() {
  delay(100);
}

// function that executes whenever data is received from master
// this function is registered as an event, see setup()
void receiveEvent(int howMany) {
  
  while (0 < Wire.available()) { // loop through all but the last
      if(z==0){
        double x = map(Wire.read(),0,17000,0,255);
        analogWrite(motor_1 , x);
        z++;
      }
      else if(z==1){
        double x = map(Wire.read(),0,17000,0,255);
        analogWrite(motor_2 , x);
        z++;
      }
       else if(z==2){
        double x = map(Wire.read(),0,17000,0,255);
        analogWrite(motor_3 , x);
        z++;
      }
      else if(z==3){
        double x = map(Wire.read(),0,17000,0,255);
        analogWrite(motor_4 , x);
        z=0;
      }
  }
  
}
float getbattery(){
  //read v0,va,vb
  float v0=analogRead(battery_v0)*(5.0/1023);
  float va=analogRead(battery_v0)*(5.0/1023);
  float vb=analogRead(battery_v0)*(5.0/1023);
  //get v1,v2
  float v1 = va*((r1+r2)/r2)-v0;
  float v2 = vb*((r3+r4)/r4)-v1-v2;
  float sum = v0+v1+v2;
  //battery capacity calculations
  float battery_capacity=100.0-((100.0*(12.6-sum))/(12.6-9.0));//12.6v is fully charged and 9v is empty charged
  return battery_capacity;
  }
void sendData(){
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);
// Calculating the distance
distance= duration*0.034/2;   
   data[0]= analogRead(current_1)*(5.0/1023);
   data[1]= analogRead(current_2)*(5.0/1023);
   data[2]= analogRead(current_3)*(5.0/1023);
   data[3]= analogRead(current_4)*(5.0/1023);
   data[4] = getbattery();
   data[5] =distance;
   Wire.write((byte*) &data,6*sizeof(float));
  }
