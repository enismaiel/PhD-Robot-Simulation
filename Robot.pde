/*
Motion Equations for two wheels differential robots
Robot Velocity = PI * dw * N
dw -> Robot Wheel Diameter
N  -> Motor speed r.p.m
*/

class Robot {
  
  Results results = new Results();
     //<>//
  float diameter;
  float distance;
  int   index = 1;  //index for number of outputs
  int condition;    //if (Nl == Nr or Nl = -Nr) = 0; 
  
  float [] velocityLeft  = {1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0, -0.1, -0.2, -0.3, -0.4, -0.5, -0.6, -0.7, -0.8, -0.9, -1.0};
  float [] velocityRight = {1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0, -0.1, -0.2, -0.3, -0.4, -0.5, -0.6, -0.7, -0.8, -0.9, -1.0};
  
  String output;
  
  float Nl;    //Right wheel velocity
  float Nr;    //Left  wheel velocity
  float theta = radians(0); //Angle with -x-axis
  
  float firstLocationX;
  float firstLocationY;
  
  float radius = 3;  //DDMR wheel radius
  float L = 6;       //Distance between two wheels
  
  float vx;
  float vy;
  PVector velocity = new PVector(vx, vy); //linear velocity
  PVector location; //DDMR current location
  float omega;      //Angular velocity
  
  float initialX;
  float initialY;
  
  Robot (){
    initialX = 300;
    initialY = 300;
    location = new PVector (initialX, initialY); // Initialize the location.
  }
  
  void calculateDiameter(){
    
    for (int iterationLeft = 0; iterationLeft < velocityLeft.length; iterationLeft ++)
    {
      for (int iterationRight = 0; iterationRight < velocityRight.length; iterationRight ++)
      {
        condition = 1;
        diameter  = 0;
        distance  = 0;
        
        Nl = velocityLeft[iterationLeft];
        Nr = velocityRight[iterationRight];
        omega = radians((radius/(2*L))*(Nl-Nr));
        
        firstLocationX = location.x;
        firstLocationY = location.y;

        if (Nl == Nr)  //<>//
          {
           condition = 0;
           output = index + ": Diameter = Infinity - Straight Movement - " + "Left Speed = " + Nl + " - Right Speed = " + Nr + "\n";
           results.addLine(output);
           //print(index + ": Diameter = Infinity - Straight Movement - " + "Left Speed = " + Nl + " - Right Speed = " + Nr + "\n"); 
           index ++;
          } else if (Nl + Nr == 0) 
          {
            condition = 0;
            output = index + ": Diameter = 0 - In place turning " + "Left Speed = " + Nl + " - Right Speed = " + Nr + "\n";
            results.addLine(output);
            //print(index + ": Diameter = 0 - In place turning " + "Left Speed = " + Nl + " - Right Speed = " + Nr + "\n");
            index ++;
          } 
          
          

        while (condition == 1) 
        {
            location.add(velocity); //new location
            velocity.x = (radius/2)*cos(theta)*(Nr + Nl); //Calculate velocity X 
            velocity.y = (radius/2)*sin(theta)*(Nr + Nl); //Calculate velocity y
            theta = theta + omega; //new angle
            distance = dist(firstLocationX, firstLocationY, location.x, location.y);
            if (diameter < distance)
              {
                diameter = distance;
              }//end of (if) statement 
            if (diameter > distance)  
              {
                output = index + " : Diameter= " + diameter + " - Left Speed = " + Nl + " - Right Speed = " + Nr + "\n";
                results.addLine(output);
                //print(index + " : Diameter= " + diameter + " - Left Speed = " + Nl + " - Right Speed = " + Nr + "\n");
                condition = 0;
                index++;
                velocity.x = 0;
                velocity.y = 0;
                
              }//end of (if) Statement
              
        }//end of (While) Loop 
      }//end (for) iterationRight loop
    }//end (for) iterationLeft loop  
    
  }//end void calculateDiameter()
  
  void display()
  {
    //Drawing Shape
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x, location.y);
    //Rotation correction
    rotate(radians(90));
    //Apply angular velocity
    rotate(theta);     
    //Start Drawing DDMR
    beginShape();
    rotate(radians(180));
    fill(255, 0, 0);
    rect(0,0,40,60);
    fill(220,220,220);
    line(20,-30,20,90);
    fill(0);
    rect(-10,0,10,25);
    rect(40,0,10,25);
    endShape(CLOSE);
    //End Drawing DDMR
    popMatrix();
  }
    
}//end class Robot
    
    /*
    
    //Velocity in the x-axis
    float vx = (radius/2)*cos(theta)*(Nr + Nl);
    //velocity in the y-axis
    float vy = (radius/2)*sin(theta)*(Nr + Nl);
    //velocity vector (x-axis, y-axis)
    velocity = new PVector (vx, vy);
    //angular velocity
    omega = radians((radius/(2*L))*(Nl-Nr));
    //Add velocity to the location
    location.add(velocity);
    theta = theta + omega;

    //Drawing Shape
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x, location.y);
    //Rotation correction
    rotate(radians(90));
    //Apply angular velocity
    rotate(theta);     
    //Start Drawing DDMR
    beginShape();
    rotate(radians(180));
    fill(255, 0, 0);
    rect(0,0,40,60);
    fill(220,220,220);
    line(20,-30,20,90);
    fill(0);
    rect(-10,0,10,25);
    rect(40,0,10,25);
    endShape(CLOSE);
    //End Drawing DDMR
    popMatrix();
    
    
    //Save the values of x and y in an ArrayList
    positionX.add(location.x);
    positionY.add(location.y);
    
    //To Draw the circle
    for (int k=0; k<positionX.size(); k++)
    {
      point(positionX.get(k), positionY.get(k));
    }

        //intilaized diameter = 0 and count = 0.  
        distance = dist(positionX.get(0), positionY.get(0), positionX.get(count), positionY.get(count));
        count +=1;
        if (diameter <= distance)
        {
          diameter = distance;
        } else 
        {
          print(diameter + "\n");
          count = 0;
        }
     }
   }
   
  }  
  */
