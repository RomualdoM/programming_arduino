//sketch 06-08

const int outputPin = 3;

void zera(){
  analogWrite(outputPin, LOW);
  delay(5000);
}

void setup()
{
  pinMode(outputPin, OUTPUT);
  attachInterrupt(0, zera, RISING);
  Serial.begin(9600);
  Serial.println("Enter Volts 1 to 5");
}

void loop()
{
  if (Serial.available() > 0)
  {
    //char ch = Serial.read();
    float volts = Serial.parseFloat();
    if (volts > 0){
      int pwmValue = volts * 255.0 / 5.0;
      //int volts = (ch - '0') * 51;
      //analogWrite(outputPin, volts);
      analogWrite(outputPin, pwmValue);
    }
  }
}
