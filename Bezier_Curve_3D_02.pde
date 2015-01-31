PVector Position;
int Pn;
float Time;
float rY;

PVector P[] = {
  new PVector(-500, 500, 0),
  new PVector(-1000, 0, 500),
  new PVector(-500, -500, -500),
  new PVector(0, -1000, 0)
};

int keisu[] = { 0, 0, 0, 0 };

int nikou(int n, int k) {
  if(k == 0 || k == n) { return 1; }
  else {
    int result;
    int a = 1;
    for(int i = 0; i < k; i++) a *= (n - i);
    result = a / kaijou(k);
    return result;
  }
}

int kaijou(int n) {
  int result = 1;
  for(int i = n; i >= 1; i--) result *= i;
  return result;
}

void setup() {
  size(1000, 1000, P3D);
  
  Time = 0;
  rY = 0;
  Pn = 4;
  
  for(int i = 0; i < Pn; i++) keisu[i] = nikou(Pn - 1, i); 
}

void draw() {
  background(0);
  lights();
  noStroke();
  
  Time += 0.01;
  
  translate(width/2, height/2);
  
  //seigyoten
  for(int i = 0; i < Pn; i++) {
    translate(P[i].x, P[i].y, P[i].z);
    if(i == 0) { fill(255, 0, 0); } else if(i == Pn-1) { fill(0, 0, 255); } else { fill(255); } 
    sphere(100);
    translate(-P[i].x, -P[i].y, -P[i].z);
  }
  
  if(Time >= 1) Time = 0.01;
  
  Position = new PVector(0.0, 0.0, 0.0);
  for(int i = 0; i < Pn; i++) {
    Position.x += keisu[i] * pow(Time, i) * pow((1 - Time), (Pn - 1) - i) * P[i].x;
    Position.y += keisu[i] * pow(Time, i) * pow((1 - Time), (Pn - 1) - i) * P[i].y;
    Position.z += keisu[i] * pow(Time, i) * pow((1 - Time), (Pn - 1) - i) * P[i].z;
  }
  
  //target
  translate(Position.x, Position.y, Position.z);
  fill(0, 255, 255);
  sphere(80);
  translate(-Position.x, -Position.y, -Position.z);
  
  beginCamera();
  camera(0, 0, 2000, 0, 0, 0, 0, 1, 0);
  rotateY(rY);
  rY -= PI / 360.0;
  endCamera();
}
