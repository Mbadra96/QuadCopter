
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
int z=0;
int d=0;
long duration;
short distance;
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
   if(d==0){
        int x = map((int)analogRead(current_1),0,1023,0,255);
        Wire.write(x);
        d++;
      }
      else if(d==1){
        int x = map((int)analogRead(current_2),0,1023,0,255);
        Wire.write(x);
        d++;
      }
       else if(d==2){
        int x = map((int)analogRead(current_3),0,1023,0,255);
        Wire.write(x);
        d++;
      }
      else if(d==3){
        int x = map((int)analogRead(current_4),0,1023,0,255);
        Wire.write(x);
        d++;
      }
      else if(d==4){
        int x = map((int)analogRead(battery),0,1023,0,255);
        Wire.write(x);
        d++;
      }
       else if(d==5){
        int x = distance;
        Wire.write(x);
        d=0;
      }
  
   /*/ void SendData(){
      digitalWrite(trigPin, LOW);
      delayMicroseconds(2);
      digitalWrite(trigPin, HIGH);
      delayMicroseconds(10);
      digitalWrite(trigPin, LOW);
      duration = pulseIn(echoPin, HIGH);
      distance= duration*0.034/2; 
       int x = map((int)analogRead(current_1),0,1023,0,255);
       Wire.write(x);
        x = map((int)analogRead(current_2),0,1023,0,255);
        Wire.write(x);
        x = map((int)analogRead(current_3),0,1023,0,255);
        Wire.write(x);
        x = map((int)analogRead(current_4),0,1023,0,255);
        Wire.write(x);
        x = map((int)analogRead(battery),0,1023,0,255);
        Wire.write(x);
        x = distance;
        Wire.write(x);
    } /*/
 
  }
