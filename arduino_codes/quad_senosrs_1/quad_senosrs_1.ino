
#include <Wire.h>
#include <Servo.h>
#include <avr/wdt.h>
// pins
const int current_1=A0;
const int current_2=A1;
const int current_3=A2;
const int current_4=A3;
int numBytes;
#define slaveAddress 0x60
byte volatile txTable[32]; 
// table of variables
struct{
  byte volatile command;
  byte volatile current[4];
  }comm;



void setup() {
  Wire.begin(slaveAddress); 
  Wire.onReceive(i2cReceive);  
  Wire.onRequest(i2cTransmit);          
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
   case 0x81:  // send all currents
     txTable[0] = comm.current[0];
     txTable[1] = comm.current[1];
     txTable[2] = comm.current[2];
     txTable[3] = comm.current[3];
     numBytes = 4;
     break;
   case 0x82:  // send current_1
     txTable[0] = comm.current[0];
     numBytes = 1;
     break;
   case 0x83: // send current_2
     txTable[0] = comm.current[1];
     numBytes = 1;
     break;
   case 0x84: // send current_3
     txTable[0] = comm.current[2];
     numBytes = 1;
     break;
   case 0x85: // send current_4
     txTable[0] = comm.current[3];
     numBytes = 1;
     break;

 }
 if (numBytes > 0) {
  
   Wire.write((byte *)&txTable, numBytes);
   wdt_reset();
   numBytes=0;
}


}

 void getdata(){
  //reading currents
   comm.current[0]= (byte) map(analogRead(current_1),0,1023,0,255);
   comm.current[1]= (byte) map(analogRead(current_2),0,1023,0,255);
   comm.current[2]= (byte) map(analogRead(current_3),0,1023,0,255);
   comm.current[3]= (byte) map(analogRead(current_4),0,1023,0,255);
  }
//using watchdog timer to reset the arduino when ever in crashes
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
