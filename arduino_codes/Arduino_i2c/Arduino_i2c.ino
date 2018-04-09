
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
//const int reset = 22;
long duration;
int distance;
int d;
Servo motor_1;
Servo motor_2;
Servo motor_3;
Servo motor_4;

#define rxFault 0x80
#define txFault 0x40
#define txRequest 0x20
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
  byte volatile txTable[32]; // prepare data for sending over I2C
void setup() {
  d=0;
  Wire.begin(slaveAddress); 
  //Serial.begin(115200);
  Wire.onReceive(receiveEvent);
  Wire.onRequest(sendData);               // register event
  pinMode(trigPin, OUTPUT); 
 // Serial.begin(9600);
  motor_1.attach(3);
  motor_2.attach(4);
  motor_3.attach(5);
  motor_4.attach(6); 
  //pinMode(reset,OUTPUT);
//  digitalWrite(reset,HIGH);
  getdata();
}

void loop() {
 motor_1.writeMicroseconds(comm.motors[0]);
 motor_2.writeMicroseconds(comm.motors[1]);
 motor_3.writeMicroseconds(comm.motors[2]);
 motor_4.writeMicroseconds(comm.motors[3]);
 getdata();
//delay(50);

//Serial.print(comm.motors[1]);

//Serial.print(comm.motors[2]);
//Serial.print("  ");
//Serial.println(comm.motors[3]);

}

void receiveEvent(int byteCount) {
   if (byteCount == 0) return;

   byte command = Wire.read();
   comm.command = command;
  if (command < 0x80) {
    i2cHandleRx(command);
  } else {
    i2cHandleTx(command);
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

  // byte *txIndex = (byte*)&txTable[0];
 byte numBytes = 0;
//  int t = 0; // temporary variable used in switch occasionally below
//
//  // check whether this request has a pending command.
//  // if not, it was a read_byte() instruction so we should
//  // return only the slave address. That is command 0.
//  if ((comm.control & txRequest) == 0) {
//    // this request did not come with a command, it is read_byte()
//    comm.command = 0; // clear previous command
//  }
//  // clear the rxRequest bit; reset it for the next request
//  comm.control &= ~txRequest;

  // If an invalid command is sent, we write nothing back. Master must
  // react to the crickets.
//  switch (comm.comand) {
//    case 0x00: // send slaveAddress.
//      txTable[0] = slaveAddress;
//      numBytes = 1;
//      break;
//    case 0x81:  // send current ,battery ,ultrasonic
//      txTable[0] = comm.current[0];
//      txTable[1] = comm.current[1];
//      txTable[2] = comm.current[2];
//      txTable[3] = comm.current[3];
//      txTable[4] = comm.battery[0];
//      txTable[5] = comm.battery[1];
//      txTable[6] = comm.battery[2];
//      txTable[7] = comm.ultrasonic[1];
//      txTable[8] = comm.ultrasonic[0];
//      
//      numBytes = 9;
//      break;
//    case 0x82:  // send current only
//      txTable[0] = comm.current[0];
//      numBytes = 1;
//      break;
//    case 0x83: // send battery only
//      txTable[0] = comm.current[1];
//      numBytes = 1;
//      break;
//    case 0x84: // send ultrasonic only
//      txTable[0] = comm.current[2];
//      numBytes = 1;
//      break;
//    case 0x85: // send battery and current
//      txTable[0] = comm.current[3];
//      numBytes = 1;
//      break;
//
//    case 0x86: // send battery and current
//      txTable[0] = comm.battery[0];
//      numBytes = 1;
//      break;
//
//    case 0x87: // send battery and current
//      txTable[0] = comm.battery[1];
//      numBytes = 1;
//      break;  
//
//    case 0x88: // send battery and current
//      txTable[0] = comm.battery[2];
//      numBytes = 1;
//      break; 
//
//    case 0x89: // send battery and current
//      txTable[0] = comm.ultrasonic[1];
//      numBytes = 1;
//      break;    
//    case 0x90:
//    txTable[0] = comm.ultrasonic[0];
//    numBytes = 1;
//    break;
//    default:
//      // If an invalid command is sent, we write nothing back. Master must
//      // react to the sound of crickets.
//     // digitalWrite(reset,LOW);
//      comm.control |= txFault;
//  }
//  if (numBytes > 0) {
//    Wire.write((byte *)&txTable, numBytes);
//}
if(d==0){
  Wire.write(comm.current[0]);
  d++;
  }
  else if(d==1){
    Wire.write(comm.current[1]);
    d++;
    }
  else if(d==2){
    Wire.write(comm.current[2]);
    d++;
    }  
  else if(d==3){
    Wire.write(comm.current[3]);
    d++;
    }
  else if(d==4){
    Wire.write(comm.battery[0]);
    d++;
    }
    
  else if(d==5){
    Wire.write(comm.battery[1]);
    d++;
    }
    
  else if(d==6){
    Wire.write(comm.battery[2]);
    d++;
    }
    
  else if(d==7){
    Wire.write(comm.ultrasonic[1]);
    d++;
    }
    
  else if(d==8){
    Wire.write(comm.ultrasonic[0]);
    d=0;
    }

  }


  byte i2cHandleRx(byte command) {
     byte result = 0;

     switch (command) {
    case 0x0A:  // read four bytes in a block to set motors
      if (Wire.available()==1) { // good write from Master
        comm.motors[0] = map(Wire.read(),0,255,700,2000);
        result = 1;
      //Serial.println(comm.motors[0]);
//Serial.println("  ");
//Serial.println(millis());
      } else {
        result = 0xFF;
      }
      
break;

    case 0x0B:  // read four bytes in a block to set motors
      if (Wire.available()==1) { // good write from Master
        comm.motors[1] = map(Wire.read(),0,255,700,2000);
        result = 1;
      } else {
        result = 0xFF;
      }
break;

    case 0x0C:  // read four bytes in a block to set motors
      if (Wire.available()==1) { // good write from Master
        comm.motors[2] = map(Wire.read(),0,255,700,2000);
        result = 1;
      } else {
        result = 0xFF;
      }
break;

    case 0x0D:  // read four bytes in a block to set motors
      if (Wire.available()==1) { // good write from Master
        comm.motors[3] = map(Wire.read(),0,255,700,2000);
        result = 1;
      } else {
        result = 0xFF;
      }
break;

    default:
result = 0xFF;
}

if (result == 0xFF){ 
  //digitalWrite(reset,LOW);
  comm.control |= rxFault;}
return result;

    }
  byte i2cHandleTx(byte command) {
  // If you are here, the I2C Master has requested information

  // If there is anything we need to do before the interrupt
  // for the read takes place, this is where to do it.
  // Examples are handling process calls. Process calls do not work
  // correctly in SMBus implementation of python on linux,
  // but it may work on better implementations.

  // signal to i2cTransmit() that a pending command is ready
  comm.control |= txRequest;
  return 0;

}

