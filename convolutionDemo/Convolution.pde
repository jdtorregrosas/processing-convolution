public class Convolution {
  PShader shader;
  PMatrix3D kernel;
  PApplet context;
  
  static final int IDENTITY = 0;
  static final int EDGE = 1;
  static final int GAUSSIAN_BLUR = 2;
  static final int TOP_SOBEL = 3;
  static final int LEFT_SOBEL = 4;
  static final int RIGHT_SOBEL = 5;
  static final int BOTTOM_SOBEL = 6;
  static final int EMBOSS = 7;
  static final int SHARPEN = 8;
  
  private int currentFilter = IDENTITY;
  
  public int getCurrentFilter (){
    return currentFilter;
  }
  
  public Convolution(PApplet p) {
    this.context = p;
    this.shader = loadShader("convolution.glsl");
  }
  void sharpen() {
    context.resetShader();
    kernel = new PMatrix3D(
      0, -1, 0, 0, 
      -1, 5, -1, 0, 
      0, -1, 0, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 1);
    shader.set("kernel", kernel, true);
    context.shader(shader);
    currentFilter = SHARPEN;
  }
  void gaussianBlur() {
    resetShader();
    kernel = new PMatrix3D(
      1, 2, 1, 0, 
      2, 4, 2, 0, 
      1, 2, 1, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 16);
    shader.set("kernel", kernel, true);
    shader(shader);
    currentFilter = GAUSSIAN_BLUR;
  }
  void edge() {
    resetShader();
    kernel = new PMatrix3D(
      -1, -1, -1, 0, 
      -1, 8, -1, 0, 
      -1, -1, -1, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 1);
    shader.set("kernel", kernel, true);
    shader(shader);
    currentFilter = EDGE;
  }
  void emboss() {
    resetShader();
    kernel = new PMatrix3D(
      -2, -1, 0, 0, 
      -1, 1, 1, 0, 
      0, 1, 2, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 1);
    shader.set("kernel", kernel, true);
    shader(shader);
    currentFilter = EMBOSS;
  }
  void bottomSobel() {
    resetShader();
    kernel = new PMatrix3D(
      -1, -2, -1, 0, 
      0, 0, 0, 0, 
      1, 2, 1, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 1);
    shader.set("kernel", kernel, true);
    shader(shader);
    currentFilter = BOTTOM_SOBEL;
  }
  void leftSobel() {
    resetShader();
    kernel = new PMatrix3D(
      1, 0, -1, 0, 
      2, 0, -2, 0, 
      1, 0, -1, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 1);
    shader.set("kernel", kernel, true);
    shader(shader);
    currentFilter = LEFT_SOBEL;
  }
  void rightSobel() {
    resetShader();
    kernel = new PMatrix3D(
      -1, 0, 1, 0, 
      -2, 0, 2, 0, 
      -1, 0, 1, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 1);
    shader.set("kernel", kernel, true);
    shader(shader);
    currentFilter = RIGHT_SOBEL;
  }
  void topSobel() {
    resetShader();
    kernel = new PMatrix3D(
      1, 2, 1, 0, 
      0, 0, 0, 0, 
      -1, -2, -1, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 1);
    shader.set("kernel", kernel, true);
    shader(shader);
    currentFilter = TOP_SOBEL;
  }
  void identity() {
    resetShader();
    kernel = new PMatrix3D(
      0, 0, 0, 0, 
      0, 1, 0, 0, 
      0, 0, 0, 0, 
      0, 0, 0, 0
      );
    shader.set("divisor", 1);
    shader.set("kernel", kernel, true);
    shader(shader);
    currentFilter = IDENTITY;
  }

  void removeShaders() {
    resetShader();
    currentFilter = IDENTITY;
  }
}