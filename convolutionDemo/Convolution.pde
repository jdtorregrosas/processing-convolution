public class Convolution {
  PShader shader;
  PMatrix3D kernel;
  PApplet context;

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
  }
  void blur() {
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
  }
}