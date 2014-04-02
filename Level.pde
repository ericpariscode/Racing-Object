class Level
{
  float rank;
  
  Level()
  {
  }
  
  Level(float theRank)
  {
    rank=theRank;
  }
  
  void get_name_level(float theRank) 
  {
     text("at level "+str(theRank),100,100);
     
  }
  
  void content_level_one()
  {
    background(10, 30, 50);
  }
  
  void content_level_two()
  {
    background(10, 30, 50);
  }
}
