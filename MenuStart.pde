class MenuStart
{
  float xPos,yPos,wMenu,hMenu;
  MenuStart()
  {
  }
  MenuStart(float x,float y,float w,float h)
  {
    x=xPos;
    y=yPos;
    w=wMenu;
    h=hMenu;
  }
  
  void display()
  {
    startGame();
    optionGame();
    exitGame();
   // testGame();
  }
  
  void common()
  {
    
  }
  
  void startGame()
  {
      noFill();
      stroke(0);
      strokeWeight(3);
      rect(width/3,height/4,300,50);
      MathLib ml=new MathLib();
      PVector vTemp;
      vTemp=ml.cal_pos_rect(width/3,height/4,300,50);  
      textSize(20);
      textAlign(CENTER);
      text("START",vTemp.x,vTemp.y);
      if(ml.is_mouse_pos_in_rect(mouseX,mouseY,width/3,height/4,300,50)==true)
      {
      }
  }
  
  void optionGame()
  {
     noFill();
     stroke(0);
     strokeWeight(3);
     rect(width/3,height/4+50+20,300,50);
     MathLib ml=new MathLib();
     PVector vTemp;
     vTemp=ml.cal_pos_rect(width/3,height/4+50+20,300,50); 
     textSize(20);
     textAlign(CENTER);
     text("HELP",vTemp.x,vTemp.y);
     if(ml.is_mouse_pos_in_rect(mouseX,mouseY,width/3,height/4+50+20,300,50)==true)
     {
     }
  }
  
  void exitGame()
  {
      noFill();
      stroke(0);
      strokeWeight(3);
      rect(width/3,height/4+50+20+50+20,300,50);
      MathLib ml=new MathLib();
      PVector vTemp;
      vTemp=ml.cal_pos_rect(width/3,height/4+50+20+50+20,300,50); 
      textSize(20);
      textAlign(CENTER);
      text("EXIT",vTemp.x,vTemp.y);
      if(ml.is_mouse_pos_in_rect(mouseX,mouseY,width/3,height/4+50+20+50+20,300,50)==true)
      {
      }
  }
  
  void testGame()
  {
    Button b=new Button(width/3,height/4+50+20+50+20+50+20,300,50);
    b.display_button(width/3,height/4+50+20+20+50+20+50,300,50); 
  }
  
  void backGame()
  {
      noFill();
      stroke(0);
      strokeWeight(3);
      rect(width/3,height/4+50+20+50+20+50+20,300,50);
      MathLib ml=new MathLib();
      PVector vTemp;
      vTemp=ml.cal_pos_rect(width/3,height/4+50+20+50+20+50+20,300,50); 
      textSize(20);
      textAlign(CENTER);
      text("BACK",vTemp.x,vTemp.y);
      if(ml.is_mouse_pos_in_rect(mouseX,mouseY,width/3,height/4+50+20+50+20+50+20,300,50)==true)
      {
      }
  }
}
