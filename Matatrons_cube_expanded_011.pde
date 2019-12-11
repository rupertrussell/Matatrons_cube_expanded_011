// Created with "Processing":https://processing.org/
// This version highlights the inner 6 pointed star
// Artwork on Redbubble at: https://www.redbubble.com/people/rupertrussell/works/35787453-metatron-s-cube-expanded-003

// Metatron’s Cube Expanded 011
// by Rupert Russell
// December 18 2018
// based on https://i.ytimg.com/vi/iQeXxu3-YNI/maxresdefault.jpg
// Artwork on Redbubble at: https://www.redbubble.com/people/rupertrussell/works/35777407-metatron-s-cube-expanded-001
// this version highlights the large 6 pointed star
// MIT licence 

int scale = 80;
float[] xInner = new float[6];
float[] yInner = new float[6];

float[] xOuter = new float[6];
float[] yOuter = new float[6];

float[] xOuterMost = new float[6];
float[] yOuterMost = new float[6];

float[] xNesting = new float[6];
float[] yNesting = new float[6];

float[] xTurningPoint = new float[6];
float[] yTurningPoint = new float[6];

int count = 0;
int sWeight = 2;


void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  noLoop();
  noFill();
  strokeWeight(sWeight);
  // strokeCap(SQUARE);
}

void draw() {
  translate(width/2, height/2);
  ellipse(0, 0, scale, scale);  // inner circle

  // calculate 6 points around the inner circle
  float step = 2 * PI/6;
  float r = scale ;
  float theta = radians(90);
  for (int count = 0; count < 6; count ++) {
    xInner[count] = r * cos(theta);
    yInner[count] = r * sin(theta);
    ellipse(xInner[count], yInner[count], scale, scale);
    theta = theta + step;
  }

  ellipse(0, 0, scale * 5, scale * 5);  // outer guide circle

  // calculate 6 points around the Outer circle
  r = scale * 2 ;
  for (int count = 0; count < 6; count ++) {
    xOuter[count] = r * cos(theta);
    yOuter[count] = r * sin(theta);
    ellipse(xOuter[count], yOuter[count], scale, scale);
    theta = theta + step;
  }


  // calculate last 6 points nesting between the inner circles
  stroke(255, 0, 0);
  theta = radians(0);
  r = scale * 1.73205 ;
  for (int count = 0; count < 6; count ++) {
    xNesting [count] = r * cos(theta);
    yNesting [count] = r * sin(theta);
    //    ellipse(xNesting [count], yNesting [count], 10, 10);
    theta = theta + step;
  }



  stroke(255);


  // calculate 6 points around the OuterMost circle
  theta = radians(90);
  r = scale * 2.5 ;
  for (int count = 0; count < 6; count ++) {
    xOuterMost[count] = r * cos(theta);
    yOuterMost[count] = r * sin(theta);
    // ellipse(xOuterMost[count], yOuterMost[count], scale, scale);
    theta = theta + step;
  }

  //// markers
  //stroke(255, 0, 0);
  //strokeWeight(2);
  //ellipse(xInner[0], yInner[0], 10, 10);
  //ellipse(xOuter[0], yOuter[0], 10, 10);
  //ellipse(xOuterMost[0], yOuterMost[0], 10, 10);
  //stroke(255, 0, 255);
  //ellipse(xNesting[0], yNesting[0], 10, 10);
  //stroke(255);

  // 4 banding circles
  ellipse(0, 0, scale * 2, scale * 2); 
  ellipse(0, 0, scale * 3, scale * 3); 
  ellipse(0, 0, scale * 4, scale * 4); 
  ellipse(0, 0, scale * 5, scale * 5); 

  // inner hexagon
  for (int counter = 0; counter < 5; counter ++) {
    line(xOuter[counter], yOuter[counter], xOuter[counter +1], yOuter[counter +1]);
  }
  line(xOuter[5], yOuter[5], xOuter[0], yOuter[0]);

  // Outer hexagon
  for (int counter = 0; counter < 5; counter ++) {
    line(xOuterMost[counter], yOuterMost[counter], xOuterMost[counter +1], yOuterMost[counter +1]);
  }
  line(xOuterMost[5], yOuterMost[5], xOuterMost[0], yOuterMost[0]);

  //3 connecting lines
  line(xOuterMost[3], yOuterMost[3], xOuterMost[0], yOuterMost[0]); // Central vertical line
  line(xOuterMost[1], yOuterMost[1], xOuterMost[4], yOuterMost[4]); // lower left to upper right
  line(xOuterMost[2], yOuterMost[2], xOuterMost[5], yOuterMost[5]); // upperleft to lower right

  //  inner triangle (1)
  line(xInner[1], yInner[1], xInner[5], yInner[5]); // bottom
  line(xInner[1], yInner[1], xInner[3], yInner[3]); // left
  line(xInner[5], yInner[5], xInner[3], yInner[3]); // right

  //  inner triangle (2)
  line(xInner[2], yInner[2], xInner[4], yInner[4]); // top
  line(xInner[4], yInner[4], xInner[0], yInner[0]); // right
  line(xInner[0], yInner[0], xInner[2], yInner[2]); // right

  //  outer triangle (3)
  line(xOuter[1], yOuter[1], xOuter[5], yOuter[5]); // bottom
  line(xOuter[1], yOuter[1], xOuter[3], yOuter[3]); // left
  line(xOuter[5], yOuter[5], xOuter[3], yOuter[3]); // right

  //  outerMost triangle (4)
  line(xOuterMost[1], yOuterMost[1], xOuterMost[5], yOuterMost[5]); // bottom
  line(xOuterMost[1], yOuterMost[1], xOuterMost[3], yOuterMost[3]); // left
  line(xOuterMost[5], yOuterMost[5], xOuterMost[3], yOuterMost[3]); // right

  //  outer triangle (5)
  line(xOuter[2], yOuter[2], xOuter[4], yOuter[4]); // top
  line(xOuter[4], yOuter[4], xOuter[0], yOuter[0]); // left
  line(xOuter[0], yOuter[0], xOuter[2], yOuter[2]); // right

  //  outerMost triangle (6)
  line(xOuterMost[2], yOuterMost[2], xOuterMost[4], yOuterMost[4]); // top
  line(xOuterMost[4], yOuterMost[4], xOuterMost[0], yOuterMost[0]); // left
  line(xOuterMost[0], yOuterMost[0], xOuterMost[2], yOuterMost[2]); // right

  // Pairs

  line(xOuter[3], yOuter[3], xInner[1], yInner[1]); // left
  line(xOuter[3], yOuter[3], xInner[5], yInner[5]); // right

  line(xOuter[4], yOuter[4], xInner[2], yInner[2]); // left
  line(xOuter[4], yOuter[4], xInner[0], yInner[0]); // right

  line(xOuter[5], yOuter[5], xInner[3], yInner[3]); // left
  line(xOuter[5], yOuter[5], xInner[1], yInner[1]); // right

  line(xOuter[0], yOuter[0], xInner[4], yInner[4]); // left
  line(xOuter[0], yOuter[0], xInner[2], yInner[2]); // right

  line(xOuter[1], yOuter[1], xInner[3], yInner[3]); // left
  line(xOuter[1], yOuter[1], xInner[5], yInner[5]); // right

  line(xOuter[2], yOuter[2], xInner[0], yInner[0]); // left
  line(xOuter[2], yOuter[2], xInner[4], yInner[4]); // right

  // Hexagram 1 
  line(xNesting[0], yNesting[0], xNesting[4], yNesting[4]); 
  line(xNesting[0], yNesting[0], xNesting[2], yNesting[2]); 

  line(xNesting[1], yNesting[1], xNesting[3], yNesting[3]); 
  line(xNesting[1], yNesting[1], xNesting[5], yNesting[5]); // right

  line(xNesting[1], yNesting[1], xNesting[3], yNesting[3]); 
  line(xNesting[1], yNesting[1], xNesting[5], yNesting[5]); 

  line(xNesting[2], yNesting[2], xNesting[4], yNesting[4]); // left
  line(xNesting[3], yNesting[3], xNesting[5], yNesting[5]); 

  // Hexagon
  line(xNesting[0], yNesting[0], xNesting[1], yNesting[1]); 
  line(xNesting[1], yNesting[1], xNesting[2], yNesting[2]); 
  line(xNesting[2], yNesting[2], xNesting[3], yNesting[3]); 
  line(xNesting[3], yNesting[3], xNesting[4], yNesting[4]); 
  line(xNesting[4], yNesting[4], xNesting[5], yNesting[5]);   
  line(xNesting[5], yNesting[5], xNesting[0], yNesting[0]); 

  // final lines

  line(xNesting[0], yNesting[0], xNesting[3], yNesting[3]); // Horozontal 
  line(xNesting[1], yNesting[1], xNesting[4], yNesting[4]);  
  line(xNesting[2], yNesting[2], xNesting[5], yNesting[5]);  

  //println(" x Outer   1 = " + xOuter[1] );
  //println(" x Nesting 0 =  " + xNesting[0] );


  // Locate turning points 
  // calculate 6 points around the OuterMost circle
  theta = step;
  r = scale * 1.1547022 ;
  for (int count = 0; count < 6; count ++) {
    xTurningPoint[count] = r * cos(theta);
    yTurningPoint[count] = r * sin(theta);
    theta = theta + step;
  }
  // ellipse(0, 0, r, r); 
  //  ellipse(xTurningPoint[0], yTurningPoint[0], 5, 5);
  // trace thicker lines
  strokeWeight(sWeight * 3);

  line(xOuter[0], yOuter[0], xTurningPoint[0], yTurningPoint[0]); 
  line(xOuter[0], yOuter[0], xTurningPoint[1], yTurningPoint[1]); 

  line(xOuter[1], yOuter[1], xTurningPoint[1], yTurningPoint[1]); 
  line(xOuter[1], yOuter[1], xTurningPoint[2], yTurningPoint[2]); 

  line(xOuter[2], yOuter[2], xTurningPoint[2], yTurningPoint[2]); 
  line(xOuter[2], yOuter[2], xTurningPoint[3], yTurningPoint[3]); 

  line(xOuter[3], yOuter[3], xTurningPoint[3], yTurningPoint[3]); 
  line(xOuter[3], yOuter[3], xTurningPoint[4], yTurningPoint[4]); 

  line(xOuter[4], yOuter[4], xTurningPoint[4], yTurningPoint[4]); 
  line(xOuter[4], yOuter[4], xTurningPoint[5], yTurningPoint[5]); 

  line(xOuter[5], yOuter[5], xTurningPoint[5], yTurningPoint[5]);
  line(xOuter[5], yOuter[5], xTurningPoint[0], yTurningPoint[0]);

  // black inner hairline 
  strokeWeight(sWeight * 1.2);
  stroke(0);

  line(xOuter[0], yOuter[0], xTurningPoint[0], yTurningPoint[0]); 
  line(xOuter[0], yOuter[0], xTurningPoint[1], yTurningPoint[1]); 

  line(xOuter[1], yOuter[1], xTurningPoint[1], yTurningPoint[1]); 
  line(xOuter[1], yOuter[1], xTurningPoint[2], yTurningPoint[2]); 

  line(xOuter[2], yOuter[2], xTurningPoint[2], yTurningPoint[2]); 
  line(xOuter[2], yOuter[2], xTurningPoint[3], yTurningPoint[3]); 

  line(xOuter[3], yOuter[3], xTurningPoint[3], yTurningPoint[3]); 
  line(xOuter[3], yOuter[3], xTurningPoint[4], yTurningPoint[4]); 

  line(xOuter[4], yOuter[4], xTurningPoint[4], yTurningPoint[4]); 
  line(xOuter[4], yOuter[4], xTurningPoint[5], yTurningPoint[5]); 

  line(xOuter[5], yOuter[5], xTurningPoint[5], yTurningPoint[5]);
  line(xOuter[5], yOuter[5], xTurningPoint[0], yTurningPoint[0]);


  //println(" y Outer   1 =  " + yOuter[1] );
  //println(" y Nesting 3 = " + yTurningPoint[3] );

  save("Matatrons-cube-expanded_011.pdf");

  // exit();
}
