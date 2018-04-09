
#include <Wire.h>
#include <Servo.h>
// pins
const int current_1=A0;
const int current_2=A1;
const int current_3=A2;
const int current_4=A3;
const int battery_v0=A4;
const int battery_va=A5;
const int battery_vb=A7;
const int trigPin = 12;
const int echoPin = 13;
long duration;
int distance;
int d;
int z;
Servo motor_1;
Servo motor_2;
Servo motor_3;
Servo motor_4;
#define slaveAddress 0x40


// table of variables
struct{
  byte volatile command;
  byte volatile control;
  byte volatile current[4];
  byte volatile battery[3];
  byte volatile ultrasonic[2];
  int volatile motors[4];
  }comm;
void setup() {
  d=0;
  z=0;
  Wire.begin(slaveAddress); 
  Wire.onReceive(receiveEvent);
  Serial.begin(115200);
  Wire.onRequest(sendData);              
  pinMode(trigPin, OUTPUT); 
  motor_1.attach(3);
  motor_2.attach(4);
  motor_3.attach(5);
  motor_4.attach(6); 
  getdata();
}

void loop() {
 motor_1.writeMicroseconds(comm.motors[0]);
 motor_2.writeMicroseconds(comm.motors[1]);
 motor_3.writeMicroseconds(comm.motors[2]);
 motor_4.writeMicroseconds(comm.motors[3]);
 getdata();
}

void receiveEvent(int byteCount) {
   if (Wire.available()>0) { // good write from Master
    if(z==0){
        comm.motors[0] = map(Wire.read(),0,255,700,2000);
      //  Serial.println(comm.motors[0]);
    z++;
    }
    else if(z==1){
       comm.motors[1] = map(Wire.read(),0,255,700,2000);
    z++;
      }
      else if(z==2){
       comm.motors[2] = map(Wire.read(),0,255,700,2000);
    z++;
      }
      else if(z==3){
       comm.motors[3] = map(Wire.read(),0,255,700,2000);
    z=0;
      }
      }
}
  

int getdistance(){
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);
// Calculating the distance
return (int)(duration*0.034/2);  
  
  }
void getdata(){
  //putting currents
   comm.current[0]= (byte) map(analogRead(current_1),0,1023,0,255);
   comm.current[1]= (byte) map(analogRead(current_2),0,1023,0,255);
   comm.current[2]= (byte) map(analogRead(current_3),0,1023,0,255);
   comm.current[3]= (byte) map(analogRead(current_4),0,1023,0,255);
   //putting battery
   comm.battery[0]=(byte) map(analogRead(battery_v0),0,1023,0,255);
   comm.battery[1]=(byte) map(analogRead(battery_va),0,1023,0,255);
   comm.battery[2]=(byte) map(analogRead(battery_vb),0,1023,0,255);
   int t= getdistance();
   if (t>=400){
    t=400;}
   //putting ultrasonic
   comm.ultrasonic[1] = (byte)(t >> 8);
   comm.ultrasonic[0] = (byte)(t & 0xFF);
  }
void sendData(){
if(d==0){
  Wire.write(comm.current[0]);
  delayMicroseconds(400);
  d++;
  }
  else if(d==1){
    Wire.write(comm.current[1]);
    delayMicroseconds(400);
    d++;
    }
  else if(d==2){
    Wire.write(comm.current[2]);
    delayMicroseconds(400);
    d++;
    }  
  else if(d==3){
    Wire.write(comm.current[3]);
    delayMicroseconds(400);
    d++;
    }
  else if(d==4){
    Wire.write(comm.battery[0]);
    delayMicroseconds(400);
    d++;
    }
    
  else if(d==5){
    Wire.write(comm.battery[1]);
    delayMicroseconds(400);
    d++;
    }
    
  else if(d==6){
    Wire.write(comm.battery[2]);
    delayMicroseconds(400);
    d++;
    }
    
  else if(d==7){
    Wire.write(comm.ultrasonic[1]);
    delayMicroseconds(400);
    d++;
    }
    
  else if(d==8){
    Wire.write(comm.ultrasonic[0]);
    delayMicroseconds(400);
    d=0;
    }

  }


