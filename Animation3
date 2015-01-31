PVector P[] = {
  new PVector(50, 50),
  new PVector(100, 350),
  new PVector(450, 450)
};
float P_scal[];
PVector position;
PVector load;
float load_scal;
int PN;
float time;
PVector wariai_v[] = {
  new PVector(0.0, 0.0), 
  new PVector(0.0, 0.0)
};
float wariai;

void setup(){
  size(500, 500);
  
  PN = 3;
  
  load = new PVector(0, 0);
  for(int i = 0; i < PN - 1; i++) {
    if(P[i].x <= P[i + 1].x) load.x += P[i + 1].x - P[i].x;
    if(P[i].x > P[i + 1].x) load.x += P[i].x - P[i + 1].x;
    if(P[i].y <= P[i + 1].y) load.y += P[i + 1].y - P[i].y;
    if(P[i].y > P[i + 1].y) load.y += P[i].y - P[i + 1].y;
  }
  
  for(int i = 0; i < PN - 2; i++) {
    P_scal[i] = sqrt(pow(P[i + 1].x - P[i].x, 2) + pow(P[i + 1].y - P[i].y, 2));
  }
  
  load_scal = sqrt(pow(load.x, 2) + pow(load.y, 2));
  
  wariai = 1 * (P_scal[0] / load_scal);
  
  for(int i = 0; i < PN - 2; i++) {
    wariai_v[i].x = P[i + 1].x - P[i].x;
    wariai_v[i].y = P[i + 1].y - P[i].y;
  }
  
  position = new PVector(0.0, 0.0);
  time = 0;
}

void draw(){
  background(0);
  time += 0.01f;
  
  for(int i = 0;i < PN; i++) {
    ellipse(P[i].x, P[i].y, 10, 10);
  }
  
  if(time <= wariai) {
    position.x += wariai_v[0].x / (P_scal[0] /0.01);
    position.y += wariai_v[0].y / (P_scal[0] /0.01);
  }
  if(time > wariai) {
    position.x += wariai_v[1].x / (P_scal[0] /0.01);
    position.y += wariai_v[1].y / (P_scal[0] /0.01);
  }
  if(time >= 1) time = 0;
  
  ellipse(position.x, position.y, 10, 10);
}
