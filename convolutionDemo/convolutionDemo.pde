import processing.video.*;
import controlP5.*;
import java.util.*;
ControlP5 cp5;

Movie myMovie;
PImage label;
Convolution c;
int filter;

void setup() {
  size(800, 600, P3D);
  c = new Convolution(this);
  myMovie = new Movie(this, "movie.mp4");
  //myMovie.loop();
  label = loadImage("flap.jpg");
  filter = Convolution.IDENTITY;
  cp5 = new ControlP5(this);
  List l = Arrays.asList("identity", "edge", "gaussian blur", "top sobel", "left sobel", "right sobel", "bottom sobel", "emboss", "sharpen");
  /* add a ScrollableList, by default it behaves like a DropdownList */
  cp5.addScrollableList("dropdown")
     .setPosition(100, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(l);
}

void draw() {
  background(0);
  /* Image */
  switch(filter){
    case Convolution.EDGE:
      c.edge();
    break;
     case Convolution.IDENTITY:
      c.identity();
    break;
     case Convolution.GAUSSIAN_BLUR:
      c.gaussianBlur();
    break;
    case Convolution.SHARPEN:
      c.sharpen();
    break;
    case Convolution.TOP_SOBEL:
      c.topSobel();
    break;
        case Convolution.LEFT_SOBEL:
      c.leftSobel();
    break;
        case Convolution.RIGHT_SOBEL:
      c.rightSobel();
    break;
    case Convolution.BOTTOM_SOBEL:
      c.bottomSobel();
    break;
    case Convolution.EMBOSS:
      c.emboss();
    break;
    default:
     c.identity();
  }
  image(label, 0, height/4, 2 * width/4, 3 * height/4 );
  image(myMovie, 2 * width/4, height/4, 2 * width/4, 3 * height/4 );
  c.removeShaders(); 
}

void movieEvent(Movie m) {
  m.read();
}

void dropdown(int n) {
  
  /* here an item is stored as a Map  with the following key-value pairs:
   * name, the given name of the item
   * text, the given text of the item by default the same as name
   * value, the given value of the item, can be changed by using .getItem(n).put("value", "abc"); a value here is of type Object therefore can be anything
   * color, the given color of the item, how to change, see below
   * view, a customizable view, is of type CDrawable 
   */
  
  //int op = (String)cp5.get(ScrollableList.class, "dropdown").getItem(n).get("name");
   filter = n;
  
}