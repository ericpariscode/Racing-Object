/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/125411*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage img;//background image
PImage img_winner;//cross
PImage img_level2;
PImage img_cheer;//imagine cheer
PImage img_start;
PImage img_guess;

int num = 60;

int gameState=-1;//state of the game

Minim minim;
AudioPlayer winSound;
AudioInput input;



int randomX;
int randomY;
//int numberOfSomething;

int radius = 40;

float x_winner=0;//location of the winner
String str_winner="";//string of the winner

float x1 = radius;
float y1 = radius;

float speed = 0.5;//speed of object 1
float speed2 = random(0, 2);//speed of object 2
float speed3 = random(0, 2);//speed of object 3
float speed4 = random(0, 2);//speed of object 4
float speedWinner=0;//speed of the winner

float speedl2=random(0,2);//speed of object in level 2
float speedl3=random(0,2);

//int speedOfSomething;
PImage boss;
boolean gameStart=false;

float b;
float R, G, B;

float spin;

//x2,y2
float x2=radius, y2=radius;
//x3,y3
float x3=radius, y3=radius;
//x4,y4
float x4=radius, y4=radius;

//pos of object in level 2
float xl1=radius,yl1=200;
float xl2=radius,yl2=radius;


int blue_times=0;
int red_times=0;
int green_times=0;

void setup_temp()
{

  size(900, 700);
  
  background(0);
  
  smooth(8);
  img=loadImage("bison.jpg");
  img_winner=loadImage("winner.png");
  img_cheer=loadImage("cheer.png");
  img_start=loadImage("racing2.png");
  img_guess=loadImage("guess.png");
  
  smooth();
  noStroke();
  smooth();
}


void setup()
{
  b=255;
  minim=new Minim(this);
  winSound=minim.loadFile("win.wav");
  setup_temp();
}

void draw()
{
  MathLib m=new MathLib();
  MenuStart ms=new MenuStart();
  
  if (mousePressed&&gameState==-1)//pressed once
  {
    if(m.is_mouse_pos_in_rect(mouseX,mouseY,width/3,height/4,300,50))
    
    //gameStart=true;
    //draw_temp();
    {
      gameState=0;
    }
    
    if(m.is_mouse_pos_in_rect(mouseX,mouseY,width/3,height/4+50+20,300,50))
    {
      gameState=10;
    }
    
    if(m.is_mouse_pos_in_rect(mouseX,mouseY,width/3,height/4+50+20+50+20,300,50))
    {
      exit();
    }
  }

  if(gameState==-1)
  {
    background(10,150,100);
    image(img_start,190,0,529,129);
    fill(0);
    textSize(30);
    
    ms.display();
  }

  else if(gameState==0)
  {
    
    draw_temp();//need loop more than one
    gameStart=true;
  }
  
  else if(gameState==1)
  {
     //draw_temp2();
  }
  
  else if(gameState==10)
  {
    background(10,150,100);
    text("This is racing game.Three objects will be running randomly.",width/2-10,height/2-40);
    text("Press f to fade the background,q to exit",width/2-10,height/2);
    ms.backGame();
    if(mousePressed&&m.is_mouse_pos_in_rect(mouseX,mouseY,width/3,height/4+50+20+50+20+50+20,300,50))
    {
      gameState=-1;
    }
    
    
  }
}

void draw_temp()
{
  AudioPlayer songTemp;
  songTemp=winSound;
  background(10, 30, 50);
 
  tint(100); 
  image(img, 0, 0, 2*width/2, 2*height/2);
  image(img_winner,600,60,50,360);
 

  float impluse=10.0;
  x1+=speed;
  //increase speed 
  x2+=speed2;
  x3+=speed3;
  x4+=speed4;
  
  
  
  fill(255,255,255);
  arc(x1, y1, radius, radius, 0.52, 5.76);
  //noFill();
  fill(#1849F2);
  arc(x2, 140, radius, radius, 0.52, 5.76);//blue
  fill(#F22318);
  arc(x3, 220, radius, radius, 0.52, 5.76);//red
  fill(#18F225);
  arc(x4, 300, radius, radius, 0.52, 5.76);//green

  fill(0);
  if(speed2==0||speed3==0||speed4==0)
  {
    speed=0;
    noFill();
    fill(255);
    MathLib mm1=new MathLib();
    PVector vv1=mm1.cal_pos_rect(x1+40,y1-30,100,50);
    text(str_winner,vv1.x,vv1.y);
    noFill();
    replay();
    return_to_main_menu();
  }
  
  if(x2>600)
  {
    x2=radius;
    x3=radius;
    x4=radius;
    x_winner=x2;
    str_winner="Blue wins";
    blue_times+=1;
   
    speed2=0;
    speed3=0;
    speed4=0;
    songTemp.play();
    Level l=new Level();
    gameStart=false;
  }
  
  else if(x3>600)
  {
    x2=radius;
    x3=radius;
    x4=radius;
    x_winner=x3;
    str_winner="Red wins";
    red_times+=1;
  
    speed2=0;
    speed3=0;
    speed4=0;
    songTemp.play();
    Level l=new Level();
    gameStart=false;
    
  }
  
  else if(x4>600)
  {
    x2=radius;
    x3=radius;
    x4=radius;
    x_winner=x4;
    str_winner="Green wins";
    green_times+=1;
    
    speed2=0;
    speed3=0;
    speed4=0;
    songTemp.play();
    Level l=new Level();
    gameStart=false;
  }
  text("Blue wins "+blue_times+" times.",780,140);
  text("Red wins "+red_times+" times.",780,220);
  text("Green wins "+green_times+" times.",780,300);
}

void draw_temp2()
{

  background(10, 30, 50);
  build_road();
  float impluse=10.0;
  
 
 
  if(key=='d')
  {
      xl1+=speedl2;
  }
  
  fill(255,255,255);
  arc(xl1, yl1, radius, radius, 0.52, 5.76);

}


void build_road()
{
  line(0,150,300+100,150);
  line(0,250,300,250);
  
  line(300+100,150,300+100,height);
  line(300,250,300,height);
}

void keyPressed()
{
  if (key=='f')
  {
    fade();
  }

  if (key==' ')
  {
    background(0);
  }

  if (key=='s')
  {
    fade();
  }
  
  if(key=='q')
  {
    exit();
  }
  
  if(gameState==1)
  {
    if(key=='k')
    {
       xl1+=speedl2;
    }
    
    if(key=='h')
    {
      xl1-=speedl2;
    }
    
    if(key=='u')
    {
      yl1-=speedl3;
    }
    
    if(key=='j')
    {
      yl1+=speedl3;
    }
  }
}

void fade()
{
  noStroke();
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
}

void replay()
{
  float px=width/2,py=height*3/4,w=200,h=100;
  MathLib r1=new MathLib();
  rect(px,py,w,h);
  PVector vr1=r1.cal_pos_rect(px,py,w,h);
  text("REPLAY",vr1.x,vr1.y);
  
  if(gameState==0&&mousePressed&&r1.is_mouse_pos_in_rect(mouseX,mouseY,px,py,w,h)==true)
  {
      
      x1=radius;
      y1=radius;
      speed=0.5;
      speed2=random(0,2);
      speed3=random(0,2);
      speed4=random(0,2);
      x2=radius;
      y2=radius;
      x3=radius;
      y3=radius;
      x4=radius;
      y4=radius;
      gameStart=true;
      gameState=0;
  }
  
}

void return_to_main_menu()
{
  float px=width/2-250,py=height*3/4,w=200,h=100;
  MathLib r1=new MathLib();
  rect(px,py,w,h);
  PVector vr1=r1.cal_pos_rect(px,py,w,h);
  text("MENU",vr1.x,vr1.y);
  if(gameState==0&&mousePressed&&r1.is_mouse_pos_in_rect(mouseX,mouseY,px,py,w,h)==true)
  {
    gameState=-1;
  } 
 
}
