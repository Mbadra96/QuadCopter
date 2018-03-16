
#include <Wire.h>

const int current_1=A0;
const int current_2=A1;
const int current_3=A2;
const int current_4=A3;
const int battery=A4;
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
   data[4] = analogRead(battery)*(5.0/1023);
   data[5] =distance;
   Wire.write((byte*) &data,6*sizeof(float));
  }
