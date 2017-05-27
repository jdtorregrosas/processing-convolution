//Código adaptado y modificado del libro: Processsing: Creative Coding And Computational Art - Ira Greenberg.


Cube externo; // cubo externo
int internos = 65;
Cube[]c = new Cube[internos]; // cubos internos
color[][]quadBG = new color[internos][80];


// Movimiento cubos internos
float[]x = new float[internos];
float[]y = new float[internos];
float[]z = new float[internos];
float[]xSpeed = new float[internos];
float[]ySpeed = new float[internos];
float[]zSpeed = new float[internos];

// Rotacion de cubos internos
float[]xRot = new float[internos];
float[]yRot = new float[internos];
float[]zRot = new float[internos];

// tamaño de cubo externo
float bordes = 350;



void setup() {
    size(800, 600, P3D);
    
    for (int i = 0; i < internos; i++){
        // Each cube face has a random color component
        float colorShift = random(-75, 75);
        quadBG[i][0] = color(220, 59, 59);
        quadBG[i][1] = color(204, 153, 0);
        quadBG[i][2] = color(43, 78, 191);
        quadBG[i][3] = color(48, 191, 43);
        quadBG[i][4] = color(0, 255, 255);
        quadBG[i][5] = color(137, 0, 255);
        
        // internos are randomly sized
        float internosize = random(20, 30);
        c[i] = new Cube(internosize, internosize, internosize);
        
        // Initialize cubie's position, speed and rotation
        x[i] = 0;
        y[i] = 0; 
        z[i] = 0;
        
        xSpeed[i] = random(-1, 1);
        ySpeed[i] = random(-1, 1); 
        zSpeed[i] = random(-1, 1); 
        
        xRot[i] = random(40, 100);
        yRot[i] = random(40, 100);
        zRot[i] = random(40, 100);
    }
    
    // Instantiate external large cube
    externo = new Cube(bordes, bordes, bordes);
}

void keyPressed() {

  if (key == '6'){
    internos = +55;
    setup();
  }
  
  if (key == '5'){
    internos = +45;
    setup();
  }
  
  if (key == '4'){
    internos = +35;
    setup();
  }

  if (key == '3'){
    internos =+25;
    setup();
  }
  if (key == '2'){
    internos =+15;
    setup();
  }
  if (key == '1'){
    internos =+5;
    setup();
  }

}

void draw(){
  background(255);
  lights();

  // Center in display window
  translate(width/2, height/2, -130);
  
  // Outer transparent cube
  noFill(); 
  
  // Rotate everything, including external large cube
  rotateX(frameCount * 0.003);
  rotateY(frameCount * 0.003);
  rotateZ(frameCount * 0.003);
    

  
  stroke(0);
  
  // Draw external large cube
  externo.create();
  
  // Move and rotate internos
  for (int i = 0; i < internos; i++){
  pushMatrix();
  translate(x[i], y[i], z[i]);
  rotateX(frameCount*PI/xRot[i]);
  rotateY(frameCount*PI/yRot[i]);
  rotateX(frameCount*PI/zRot[i]);
  noStroke();
  c[i].create(quadBG[i]);
  x[i] += xSpeed[i];
  y[i] += ySpeed[i];
  z[i] += zSpeed[i];
  popMatrix();
  
  // Draw lines connecting cubbies


    // Check wall collisions
    if (x[i] > bordes/2 || x[i] < -bordes/2){
    xSpeed[i]*=-1;
    }
    if (y[i] > bordes/2 || y[i] < -bordes/2){
    ySpeed[i]*=-1;
    }
    if (z[i] > bordes/2 || z[i] < -bordes/2){
    zSpeed[i]*=-1;
    }
  }
}

class Cube{
  PVector[] vertices = new PVector[24];
  float w, h, d;
  //Constructores
  Cube(){ }
  
  Cube(float w, float h, float d) {
  this.w = w;
  this.h = h;
  this.d = d;
  
  //front
  vertices[0] = new PVector(-w/2,-h/2,d/2);
  vertices[1] = new PVector(w/2,-h/2,d/2);
  vertices[2] = new PVector(w/2,h/2,d/2);
  vertices[3] = new PVector(-w/2,h/2,d/2);
  //left
  vertices[4] = new PVector(-w/2,-h/2,d/2);
  vertices[5] = new PVector(-w/2,-h/2,-d/2);
  vertices[6] = new PVector(-w/2,h/2,-d/2);
  vertices[7] = new PVector(-w/2,h/2,d/2);
  //right
  vertices[8] = new PVector(w/2,-h/2,d/2);
  vertices[9] = new PVector(w/2,-h/2,-d/2);
  vertices[10] = new PVector(w/2,h/2,-d/2);
  vertices[11] = new PVector(w/2,h/2,d/2);
  //back
  vertices[12] = new PVector(-w/2,-h/2,-d/2); 
  vertices[13] = new PVector(w/2,-h/2,-d/2);
  vertices[14] = new PVector(w/2,h/2,-d/2);
  vertices[15] = new PVector(-w/2,h/2,-d/2);
  //top
  vertices[16] = new PVector(-w/2,-h/2,d/2);
  vertices[17] = new PVector(-w/2,-h/2,-d/2);
  vertices[18] = new PVector(w/2,-h/2,-d/2);
  vertices[19] = new PVector(w/2,-h/2,d/2);
  //bottom
  vertices[20] = new PVector(-w/2,h/2,d/2);
  vertices[21] = new PVector(-w/2,h/2,-d/2);
  vertices[22] = new PVector(w/2,h/2,-d/2);
  vertices[23] = new PVector(w/2,h/2,d/2);
  }
  void create(){
  // Draw cube
    for (int i=0; i<6; i++){
        beginShape(QUADS);
        for (int j=0; j<4; j++){
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
        }
        endShape();
      }
  }
  void create(color[]quadBG){
  // Draw cube
  for (int i=0; i<6; i++){
  fill(quadBG[i]);
  beginShape(QUADS);
  for (int j=0; j<4; j++){
  vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
  }
  endShape();
  }
  }
}