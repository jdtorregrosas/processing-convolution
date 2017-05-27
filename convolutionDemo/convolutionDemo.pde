import processing.video.*;

Movie myMovie;
PImage label;
Convolution c;

void setup() {
  size(800, 600, P3D);
  c = new Convolution(this);
  myMovie = new Movie(this, "movie.mp4");
  myMovie.loop();
  label = loadImage("flap.jpg");
}

void draw() {
  background(0);
  /* Image */
  c.identity();
  image(label, 0, 0, width/4, height/4 );
  c.blur();
  image(label, 0, height/4, width/4, height/4 );
  c.edge();
  image(label, 0, 2 * height/4, width/4, height/4 );
  c.leftSobel();
  image(label, 0, 3 * height/4, width/4, height/4 );
  
  c.sharpen();
  image(label, width/4, 0, width/4, height/4 );
  c.emboss();
  image(label, width/4, height/4, width/4, height/4 );
  c.bottomSobel();
  image(label, width/4, 2 * height/4, width/4, height/4 );
  c.identity();
  image(label, width/4, 3 * height/4, width/4, height/4 );
  
  /* Video */
  c.identity();
  image(myMovie, 2 * width/4, 0, width/4, height/4 );
  c.blur();
  image(myMovie, 2 * width/4, height/4, width/4, height/4 );
  c.edge();
  image(myMovie, 2 * width/4, 2 * height/4, width/4, height/4 );
  c.topSobel();
  image(myMovie, 2 * width/4, 3 * height/4, width/4, height/4 );
  
  c.sharpen();
  image(myMovie, 3 *width/4, 0, width/4, height/4 );
  c.emboss();
  image(myMovie, 3 * width/4, height/4, width/4, height/4 );
  c.rightSobel();
  image(myMovie, 3 * width/4, 2 * height/4, width/4, height/4 );
  c.identity();
  image(myMovie, 3 * width/4, 3 * height/4, width/4, height/4 );
}

void movieEvent(Movie m) {
  m.read();
}