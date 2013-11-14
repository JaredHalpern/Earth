
/**
 Earth and Moon
 Shapes3D library: http://www.lagers.org.uk/s3d4p/index.html
 */

import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

//import processing.opengl.*;

Ellipsoid sun, earth, moon, stars, venus;
Box orbiter;

boolean attached = true;
float rotx = -0.3;
float roty = -0.3;
float distance = 0;

public void setup() {
  size(1600, 1200, OPENGL);  

  // Create the sun
  sun = new Ellipsoid(this, 56, 56);
  sun.setTexture("sun.jpg");
  sun.setRadius(120);
  sun.moveTo(new PVector(0, 0, 0));
  sun.strokeWeight(1.0f);
  sun.stroke(color(255, 255, 0));
  sun.moveTo(0, 0, -380);
  sun.tag = "sun";
  sun.drawMode(Shape3D.TEXTURE);

  // Create the earth
  earth = new Ellipsoid(this, 26, 26);
  earth.setTexture("earth.jpg");
  earth.setRadius(38);
  earth.moveTo(new PVector(0, 0, 0));
  earth.strokeWeight(1.0f);
  earth.stroke(color(255, 255, 0));
  earth.moveTo(0, 0, 580);
  earth.tag = "Earth";
  earth.drawMode(Shape3D.TEXTURE);

  // Create the moon
  moon = new Ellipsoid(this, 20, 20);
  moon.setTexture("moon.jpg");
  moon.drawMode(Shape3D.TEXTURE);
  moon.setRadius(7);
  moon.moveTo(0, 0, 70);
  moon.tag = "Moon";

  // Create Venus
  venus = new Ellipsoid(this, 26, 26);
  venus.setTexture("venus.jpg");
  venus.setRadius(18);
  venus.moveTo(new PVector(0, 0, 0));
  venus.strokeWeight(1.0f);
  venus.stroke(color(255, 255, 0));
  venus.moveTo(0, 0, 320);
  venus.tag = "venus";
  venus.drawMode(Shape3D.TEXTURE);

  // Create satellite orbiter
  orbiter = new Box(this, 3, 3, 10);
  orbiter.setTexture("chip.jpg");
  orbiter.moveTo(0, 0, -48);
  orbiter.rotateBy(radians(90.0f), radians(90.0f), 0);
  orbiter.strokeWeight(1.0f);
  orbiter.stroke(color(255,255,0));
  orbiter.tag = "orbiter";
  orbiter.drawMode(Shape3D.TEXTURE);
 
  // Create the star background
  stars = new Ellipsoid(this, 10, 10);
  stars.setTexture("stars.jpg", 5, 5);
  stars.drawMode(Shape3D.TEXTURE);
  stars.setRadius(800); // view takes place inside the stars ellipsoid

  sun.addShape(venus);
  sun.addShape(earth);
  earth.addShape(moon);
  earth.addShape(orbiter);
}

public void draw() {
  pushStyle();
  // Change the rotations before drawing
  camera(0, 0, 400+distance, 0, 0, 0, 0, 1, 0);
  noLights();
  pointLight(255,  255,  255,  0,  0,  200); 
//  if (mousePressed) 
//    if (mouseButton == LEFT)
if(abs(pmouseY-mouseY) > (.3)){
      rotx = constrain(rotx + (pmouseY-mouseY)*0.003, -HALF_PI, HALF_PI);
      roty = constrain(rotx + (pmouseX-mouseX)*0.003, -HALF_PI, HALF_PI);
}      
//    else distance = constrain(distance + (mouseY-pmouseY), -200, 200);  
  else
  { // do rotation before drawing
  
  sun.rotateBy(0,radians(0.01f),0);
  earth.rotateBy(0, radians(0.2f), 0);
  moon.rotateBy(0, radians(0.3f), 0);//radians(1.5f), 0,0);//radians(1.0f), 0);
  venus.rotateBy(0, radians(1.0f), 0);
  orbiter.rotateBy(0, 0, 0);
  stars.rotateBy(0, 0, radians(0.02f));
  }
  rotateX (rotx);
  rotateY (roty);

  background(0);
  pushMatrix();
//  lights();

  sun.draw();
  stars.draw();
  popMatrix();
  popStyle();
}
