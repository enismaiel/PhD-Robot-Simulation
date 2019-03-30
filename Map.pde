class Map {

  int mapWidth;
  int mapHeight;
  int unitSize;
  int mapStartX;
  int mapStartY;
  int [] unitX; 
  int [] unitY; 
  
  
  Map (int c_mapWidth, int c_mapHeight, int c_unitSize){
    mapWidth  = c_mapWidth;
    mapHeight = c_mapHeight;
    unitSize  = c_unitSize;
    mapStartX = 30;
    mapStartY = 30;    
  }
  
  void display(){
    
    int count = 0;
    unitX = new int [144];
    unitY = new int [144];
    
    stroke(0);
    fill(213, 230, 246);
    rectMode(CORNER);
    rect(mapStartX, mapStartY, mapWidth, mapHeight);
    for (int i=mapStartX; i < (mapWidth+mapStartX); i=i+unitSize){
      for (int j=mapStartY; j < (mapHeight+mapStartY); j=j+unitSize) {
        stroke(0);
        fill(255);
        rectMode(CORNER);
        rect(i, j, unitSize, unitSize);
        unitX [count] = i;
        unitY [count] = j;
        count = count + 1;
      }
    }
  }
}
