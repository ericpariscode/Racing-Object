class MathLib
{
  
  MathLib()
  {
  }
  
  PVector cal_pos_rect(float xPos,float yPos,float wRect,float hRect)
  {
    PVector result;
    result=new PVector(xPos+wRect/2,yPos+hRect/2);
    return result;
  }
  
  boolean is_mouse_pos_in_rect(float mx,float my,float xPos,float yPos,float wRect,float hRect)
  {
    if(mx>=xPos&&mx<=xPos+wRect&&my>=yPos&&my<=yPos+hRect)
    {
      return true;
    }
    return false;
  }
  
  int constrain(int value, int min, int max) {
    return min(max(value, min), max);
  }

  
  
}
