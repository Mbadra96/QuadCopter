
#include <Wire.h>
#include <Servo.h>
#include <avr/wdt.h>
// pins
const int battery_v0=A3;
const int battery_va=A2;
const int battery_vb=A1;
const int trigPin = 13;
const int echoPin = 12;
int numBytes;
long duration;
int distance;
#define slaveAddress 0x80
byte volatile txTable[32]; 

// table of variables
struct{
  byte volatile command;
  byte volatile battery[3];
  byte volatile ultrasonic[2];
  }comm;



void setup() {
  Wire.begin(slaveAddress); 
  Wire.onReceive(i2cReceive);  
  Wire.onRequest(i2cTransmit);          
  pinMode(trigPin, OUTPUT); 
  watchdogSetup();
  getdata();
}

void loop() { 
  getdata();
  delayMicroseconds(50000);
}

void i2cReceive(int byteCount) {
if (byteCount == 0) return;
byte command = Wire.read();
comm.command = command;
}
void i2cTransmit(byte command){
switch (comm.command) {
   case 0x00: // send slaveAddress.
     txTable[0] = slaveAddress;
     numBytes = 1;
     break;
   case 0x81:  // send current ,battery ,ultrasonic
     txTable[0] = comm.battery[0];
     txTable[1] = comm.battery[1];
     txTable[2] = comm.battery[2];
     txTable[3] = comm.ultrasonic[1];
     txTable[4] = comm.ultrasonic[0];
     numBytes = 5;
     break;
   case 0x82: // send battery and current
     txTable[0] = comm.battery[0];
     numBytes = 1;
     break;

   case 0x83: // send battery and current
     txTable[0] = comm.battery[1];
     numBytes = 1;
     break;  

   case 0x84: // send battery and current
     txTable[0] = comm.battery[2];
     numBytes = 1;
     break; 

   case 0x85: // send battery and current
     txTable[0] = comm.ultrasonic[1];
     numBytes = 1;
     break;    
   case 0x96:
   txTable[0] = comm.ultrasonic[0];
   numBytes = 1;
   break;
   default:
   numBytes=0;
 }
 if (numBytes > 0) {
  
   Wire.write((byte *)&txTable, numBytes);
   wdt_reset(); /   case 0x82:  // send current only
     txTable[0] = comm.current[0];
     numBytes = 1;
     break;
   case 0x83: // send battery only
     txTable[0] = comm.current[1];
     numBytes = 1;
     break;
   case 0x84: // send ultrasonic only
     txTable[0] = comm.current[2];
     numBytes = 1;
     break;
   case 0x85: // send battery and current
     txTable[0] = comm.current[3];
     numBytes = 1;
     break;/ to make watchdogtimer reset as a new loop has been done
   numBytes=0;
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
   //putting battery
   comm.battery[0]=(byte) map(analogRead(battery_v0),0,1023,0,255);
   comm.battery[1]=(byte) map(analogRead(battery_va),0,1023,0,255);
   comm.battery[2]=(byte) map(analogRead(battery_vb),0,1023,0,255);
   int t= getdistance();
   if (t>=400){
    t=400;
    }
   //putting ultrasonic
   comm.ultrasonic[1] = (byte)(t >> 8);
   comm.ultrasonic[0] = (byte)(t & 0xFF);
  }
  void watchdogSetup(void){
cli();  // disable all interrupts
wdt_reset(); // reset the WDT timer
/*
WDTCSR configuration:
WDIE = 1: Interrupt Enable
WDE = 1 :Reset Enable
WDP3 = 0 :For 125ms Time-out
WDP2 = 0 :For 125ms Time-out
WDP1 = 1 :For 125ms Time-out
WDP0 = 1 :For 125ms Time-out
*/
// Enter Watchdog Configuration mode:
WDTCSR |= (1<<WDCE) | (1<<WDE);
// Set Watchdog settings:
WDTCSR = (1<<WDIE) | (1<<WDE) | (0<<WDP3) | (0<<WDP2) | (1<<WDP1) | (1<<WDP0);
sei();
}
ISR(WDT_vect) // Watchdog timer interrupt.
{
// Include your code here - be careful not to use functions they may cause the interrupt to hang and
// prevent a reset.
  }
