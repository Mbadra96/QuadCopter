
#include <Wire.h>
#include <Servo.h>
const int current_1=A0;
const int current_2=A1;
const int current_3=A2;
const int current_4=A3;
const int battery_v0=A4;
const int battery_va=A5;
const int battery_vb=A7;
const int trigPin = 12;
const int echoPin = 13;
float data[6];
float motor[4];
int z=0;
int d=0;
long duration;
float distance;
Servo motor_1;
Servo motor_2;
Servo motor_3;
Servo motor_4;
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
  motor_1.attach(3);
  motor_2.attach(4);
  motor_3.attach(5);
  motor_4.attach(6); 
  
}

void loop() {
  delay(100);
}

// function that executes whenever data is received from master
// this function is registered as an event, see setup()
void receiveEvent(int howMany) {
  
  while (0 < Wire.available()) { // loop through all but the last
      if(z==0){
        double x = map(Wire.read(),0,255,700,2300);
        motor_1.writeMicroseconds(x);
        z++;
      }
      else if(z==1){
        double x = map(Wire.read(),0,255,700,2300);
        motor_2.writeMicroseconds(x);
        z++;
      }
       else if(z==2){
        double x = map(Wire.read(),0,255,700,2300);
        motor_3.writeMicroseconds(x);
        z++;
      }
      else if(z==3){
        double x = map(Wire.read(),0,255,700,2300);
        motor_4.writeMicroseconds(x);
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
   data[4]=analogRead(battery_v0)*(5.0/1023);
   data[5]=analogRead(battery_va)*(5.0/1023);
   data[6]=analogRead(battery_vb)*(5.0/1023);
   Serial.println(data[4])*(5.0/1023);
   Serial.println(data[5])*(5.0/1023);
   Serial.println(data[6])*(5.0/1023);
   Serial.println("-----");
   data[7] =distance;
   Wire.write((byte*) &data,8*sizeof(float));
  }
