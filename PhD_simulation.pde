//www.db4free.net
//un: ismaiel_phd
//pw: liverpool

Map myMap;
Robot myRobot = new Robot();
Database myDatabase = new Database();

void setup()
{
  size(1000,1000);
  //myMap = new Map (600,600,10);
  myRobot.calculateDiameter();
  myDatabase.createDatabase();
}

void draw()
{
  myRobot.display();
 
}
