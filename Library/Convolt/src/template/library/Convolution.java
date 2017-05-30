package convolt;
import processing.core.*;
import processing.opengl.*;

/**
 * This is a template class and can be used to start a new processing Library.
 * Make sure you rename this class as well as the name of the example package 'template' 
 * to your own Library naming convention.
 * 
 * (the tag example followed by the name of an example included in folder 'examples' will
 * automatically include the example in the javadoc.)
 *
 * @example Hello 
 */

public class Convolution extends PApplet {
	
	  PShader shader;
	  PMatrix3D kernel;
	  PApplet context;
	  
	  public static final int IDENTITY = 0;
	  public static final int EDGE = 1;
	  public static final int GAUSSIAN_BLUR = 2;
	  public static final int TOP_SOBEL = 3;
	  public static final int LEFT_SOBEL = 4;
	  public static final int RIGHT_SOBEL = 5;
	  public static final int BOTTOM_SOBEL = 6;
	  public static final int EMBOSS = 7;
	  public static final int SHARPEN = 8;
	  
	  public int currentFilter = IDENTITY;
	  
	  public int getCurrentFilter (){
	    return currentFilter;
	  }
	  
	  public Convolution(PApplet p) {
	    this.context = p;
	    this.shader = loadShader("convolution.glsl");
	  }
	  public void sharpen() {
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
	  public void gaussianBlur() {
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
	  public void edge() {
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
	  public void emboss() {
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
	  public void bottomSobel() {
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
	  public void leftSobel() {
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
	  public void rightSobel() {
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
	  public void topSobel() {
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
	  public void identity() {
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

	  public void removeShaders() {
	    resetShader();
	    currentFilter = IDENTITY;
	  }
	}
