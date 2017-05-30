package template.library;
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
	
	 public static void main(String[] args) {
	    	PApplet.main("convolutionLibrary.Convolution");
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
