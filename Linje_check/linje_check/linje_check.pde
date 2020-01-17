Input valgteTal=new Input();
void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  clear();
  valgteTal.tegn();

  if (valgteTal.korCheck) {
    valgteTal.konverter();
    valgteTal.check();
  }
}

void keyPressed() {
  valgteTal.tast();
}
