
#include <Wire.h>
#include <Servo.h>
#include <avr/wdt.h>
#define slaveAddress 0x20

// table of variables
struct{
  byte volatile command;
  int volatile motors[4];
  }comm;
void setup() {
  Wire.begin(slaveAddress); 
  Wire.onReceive(i2cReceive);             
  DDRD = DDRD | 0B01111000;
  watchdogSetup();
}

void loop() {
    write_motor1(comm.motors[0]);
    write_motor2(comm.motors[1]);
    write_motor3(comm.motors[2]);
    write_motor4(comm.motors[3]);
}

void i2cReceive(int byteCount) {
if (byteCount == 0) return;
byte command = Wire.read();
comm.command = command;
if (command < 0x80) {
i2cHandleRx(command, byteCount - 1);
} else {
}
  }

void i2cHandleRx(byte command, int byteCount) {
  
switch (command) {
  case 0x0A:
  if(Wire.available()==4){
    comm.motors[0]= map(Wire.read(),0,255,700,2000);
    comm.motors[1]= map(Wire.read(),0,255,700,2000);
    comm.motors[2]= map(Wire.read(),0,255,700,2000);
    comm.motors[3]= map(Wire.read(),0,255,700,2000);
    wdt_reset();
    }
   break;
  case 0x0B:
  if(Wire.available()==1){
    comm.motors[0]= map(Wire.read(),0,255,700,2000);
    wdt_reset();
    }
   break;
   case 0x0C:
   if(Wire.available()==1){
    comm.motors[1]= map(Wire.read(),0,255,700,2000);
    wdt_reset();
    }
   break;
   case 0x0D:
   if(Wire.available()==1){
    comm.motors[2]= map(Wire.read(),0,255,700,2000);
    wdt_reset();
    }
   break;
   case 0x0E:
   if(Wire.available()==1){
    comm.motors[3]= map(Wire.read(),0,255,700,2000);
    wdt_reset();
    }
   break;
   default:
    comm.motors[0]-= 50;
    comm.motors[1]-= 50;
    comm.motors[2]-= 50;
    comm.motors[3]-= 50;
}
  }
void write_motor1(int value){
  PORTD = 0B000001000;
  delayMicroseconds(value);
  PORTD = 0B000000000;
  delayMicroseconds(20000-value);
  
  }
void write_motor2(int value){
  PORTD = 0B000010000;
  delayMicroseconds(value);
  PORTD = 0B000000000;
  delayMicroseconds(20000-value);
  
  }
void write_motor3(int value){
  PORTD = 0B000100000;
  delayMicroseconds(value);
  PORTD = 0B000000000;
  delayMicroseconds(20000-value);
  
  }
void write_motor4(int value){
  PORTD = 0B001000000;
  delayMicroseconds(value);
  PORTD = 0B000000000;
  delayMicroseconds(20000-value);
  
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
