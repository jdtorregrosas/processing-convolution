  
import processing.video.*;
Movie myMovie;
PShader bwShader;

void setup() {
  size(300, 200, P3D);
  bwShader = loadShader("test.glsl");
  myMovie = new Movie(this, "movie.mp4");
  myMovie.loop();
}

void draw() {
  shader(bwShader);
  image(myMovie, 0, 0);
}

void movieEvent(Movie m) {
  m.read();
}


/*float canSize = 60;
PImage label;
PShape can;
PShape cap;
float angle;

PShader selShader;
boolean useLight;
boolean useTexture;

PShader colorShader;
PShader lightShader;
PShader texShader;
PShader texlightShader;
PShader pixlightShader;
PShader texlightxShader;
PShader bwShader;
PShader edgesShader;
PShader embossShader;

void setup() {
  
  label = loadImage("flap.jpg");
  size(800, 600, P3D);
  bwShader = loadShader("test.glsl");
  /*
  colorShader = loadShader("colorfrag.glsl", "colorvert.glsl");
  lightShader = loadShader("lightfrag.glsl", "lightvert.glsl");
  texShader = loadShader("texfrag.glsl", "texvert.glsl");
  
  texlightShader = loadShader("texlightfrag.glsl", "texlightvert.glsl");
  pixlightShader = loadShader("pixlightfrag.glsl", "pixlightvert.glsl");
  texlightxShader = loadShader("pixlightxfrag.glsl", "pixlightxvert.glsl");
  
  bwShader = loadShader("bwfrag.glsl");
  edgesShader = loadShader("edgesfrag.glsl");
  embossShader = loadShader("embossfrag.glsl");
  
  selShader = texlightShader;
  useLight = true;
  useTexture = true;
  println("Vertex lights, texture shading");
}

void draw() {
  background(0);
  shader(bwShader);
  image(label, 0, 0 );
}*/