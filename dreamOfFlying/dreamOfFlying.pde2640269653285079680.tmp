import ddf.minim.*;
Minim minim;

AudioPlayer menu; 
AudioPlayer playbgm1; 
AudioPlayer end1;
AudioPlayer anniu;
AudioPlayer attack;
AudioPlayer ok ; 
AudioPlayer hpplus ; 
AudioPlayer error ; 

PImage fly ; 
PImage end ; 
PImage newhere ;
PImage enter ; 
PImage back ; 
PImage plane ; 
PImage HP;
PImage HPUI;
PImage zhangai ; 
PImage kill ; 
PImage enemy ; 

PImage game1 ; 
PImage game2 ;
PImage game3 ;
PImage game4 ;


int savetime = 0 ;//Record  time
boolean timesave = false ; //The value of savetime will be updated only when it is true
int runningtime ; //record tunning time
int Presstime ; //When the record is clicked, it is updated every time the mouse is clicked
int controlMode = 1 ; //control Mode 1 is key board，2 is mouse
int getcontrol = 0;  //
boolean keystop = false ; //the "StopMode" in keyboardMode
int screenMode = 0 ; //screenmode control

int hp = 10; //HP
int hptime = 10 ;//time pf Hp recovery
boolean rehp = false ;
int level = 1 ; //0 EZ  1 NORMAL   2 HIGHEST
int part = 0; 


boolean exit = false ; 
boolean restart = false ;
boolean getstart = false ;
boolean backmenu = false ; 
boolean bgm1p = false ; 


int score  = 0 ; //Points
int scoret = 0 ; //
int scoreg = 0 ; //

boolean press = false;

int locationx = 150 ; 
int locationy = 200 ; 
int r = 75 ; 
int a = 0 ; 
int g = 10 ; 
int killx = 0;
int killy = 0;
int killtime ; 

//int []bulletx = new int[30];//子弹库x
//int []bullety = new int[30];//子弹库y
//int bulletcount = 0 ;
     
int rectmove = -5 ;//Rectangular movement speed, the greater the absolute value, the greater the difficulty
int distance = 300 ;//Two rectangle spacing
int rectwidth = 100 ; //
int recttime = 0 ; //
boolean drawrect = false ; //
int [] arrayrectx = new int [20];//
int countrect =0 ; //
float [] randomhight = new float[20];//
int judge = 30 ; //Determine area repair, the larger the value, the greater the difficulty. 30 is probably the most normal

int enemytime =2000; //
int [] arrayenemy = new int [20];//
float [] enemyhight = new float [20]; //
int countenemy ; //
int timeOfenemy ; //
int  enemymove =-20 ;//
int  enemyr = 80 ; //
boolean drawenemy = false;

boolean fadeenemy = false ; 




void setup() {
size(1300,1000);

fly = loadImage("fly.jpg");
end = loadImage("end.jpg");
newhere = loadImage("new.png");
enter = loadImage("enter.png");
back = loadImage("back.png");
plane = loadImage("plane.png");
HP = loadImage("HP.png");
HPUI = loadImage("HPUI.png");
zhangai = loadImage("zhangai.png");
game1 = loadImage("game1.jpg");
game2 = loadImage("game2.jpg");
game3 = loadImage("game3.jpg");
game4 = loadImage("game4.jpg");
kill = loadImage("kill.png");
enemy = loadImage("enemy.png");

minim = new Minim(this);
playbgm1 = minim.loadFile("Twilight_Melody (1)mp3.mp3");
end1 = minim.loadFile("youweiqingnian.mp3");
menu = minim.loadFile("Lights Frightened The Captain - Stars As Lights.mp3");
anniu = minim.loadFile("anniu.wav");
attack=minim.loadFile("attack.wav");
ok = minim.loadFile("ok.wav");
hpplus = minim.loadFile("hpplus.mp3");
error = minim.loadFile("error.wav");

for (int i = 0 ; i <= 19; i++ )
{
arrayrectx[i] = 1000 ;
}

for (int i = 0 ; i <= 19 ; i++ )
{
 arrayenemy[i] = 1000 ;
}

}

void draw(){
  frameRate(60);
  // screenMode 0
if(screenMode == 0){
 background(0,0,0);
 fill(225,225,225);
 menu.play();
 mainMenu();
}
  
  
//screenMode1
if(screenMode == 1){
 background(0,0,0);
 fill(225,225,225);
 textSize(60);
 text("Choose your control",250,500);
 text("1-use keyboard ; 2-use mouse. ",150,600);
 
 level = 0 ;
 
 if(getcontrol == 1){
   
  background(0,0,0);
  textSize(200);
  text("KeyBorad!",250,500);
  
  textSize(100);
  text("Take g to start",250,600);
  if(getstart == true){
  
    controlMode = 1 ; 
    screenMode = 2 ;
    getcontrol = 0 ;
    timesave =true ; 
  }
   }
 
  if(getcontrol == 2){
   
  background(0,0,0);
  textSize(200);
  text("Mouse!",250,500);
  
  textSize(100);
  text("Take g to start",250,600);
  if(getstart == true){
    controlMode = 2 ; 
    screenMode = 2 ; 
    getcontrol = 0 ;
    timesave =true ; 
  }
   
 }
 
 
}






if(screenMode == 11){
  background(0,0,0);
  textSize(70);
  fill(225,225,225);
  text("Welcome to the course for beginners!",0,100);
  textSize(60);
  text("Level:",0,550);
  text("Points and HP:",0,250);
  textSize(40);
  text("Everytime you pass a barrier,kill enemy,you will get points; \nAnd how long did you survive can also affect the points;\nWhen you strike them,HP-1;\nBy the way,As time goes on,Difficulity will get harder!",0,300);
  text("EZ: you can choose mouse or keyboar to control the player \n      and what should you do is just move! ",0,600);
  text("Normal: Default Level,Only use keyboard to control,\n             pressed ‘space’to jump,when jumping pressed to fall\n             Pressed  'z' to stop; 'x' or 'space' to recovery\n             pressed 'c' to kill enenmy ",0,750);
  text("Higest: Faster,More enemy,MORE POINTS aw well!",0,975);
  
  ellipsePressed(1100,900,150,0);
  imageMode(CENTER);
  image(back,1100,900,100,100);
  
} 
  

  if(screenMode == 12){
  
    background(0,0,0);
    fill(255,255,255);
    textSize(100);
    text("Choose Your Difficulty",100,100);
    
    rectPressed(650,250,400,100,1);
    fill(0,0,0);
    textSize(80);
    text("EZ",600,285);
    
    rectPressed(350,450,400,100,131);
    fill(0,0,0);
    textSize(80);
    text("Normal",230,485);
    
    rectPressed(950,450,400,100,132);
    fill(0,0,0);
    textSize(80);
    text("Highest",830,485);
    
    ellipsePressed(100,900,100,0);
    imageMode(CENTER);
    image(back,100,900,50,50);
    
    
    ellipsePressed(300,900,100,11);
    imageMode(CENTER);
    image(newhere,300,900,100,100);
  }
  
  if(screenMode == 131){
    //Normal
   background(0,0,0);
   textSize(80);
   fill(255,255,255);
   text("You chose Normal Level ",200,300);
   text("Take 'g' to start ",200,500);
     if(getstart == true){
    controlMode = 1 ; 
    screenMode = 2 ;
    getcontrol = 0 ;
    timesave =true ; 
    level = 1 ; 
    //g = g+5;
  }
}

  if(screenMode == 132){
    
   background(0,0,0);
   textSize(80);
   fill(255,255,255);
   text("You chose Highest Level ",200,300);
   text("Take 'g' to start ",200,500);
     if(getstart == true){
       //Highest
    controlMode = 1 ; 
    screenMode = 2 ;
    getcontrol = 0 ;
    timesave =true ; 
    level = 2 ; 
    rectmove = rectmove-10;
    g = g+5;
  }
}
    
  
  
  
// screenMode2  
 if(screenMode == 2){
        //HP
        if(hp==0){
          exit = false ;
          restart = false;
          playbgm1.rewind();
          playbgm1.pause();
          screenMode = 3 ; 
        }
      menu.pause();
      menu.rewind();
          
        if(bgm1p == false){
        playbgm1.play();
        bgm1p = true ; 
        }
        
        
      if(part == 0) {
        imageMode(CENTER);
        image(game1,750,500);//
      }
      if(part == 1) {
        imageMode(CENTER);
                    image(game2,750,500);
      }
      if(part == 2) {
        imageMode(CENTER);
        image(game3,550,500);
      }
      if(part == 3)
      {
        imageMode(CENTER);
        image(game4,750,500);
      }
      if(part == 4) screenMode =3 ; 
      

      
      
       runningtime  = millis() ;  //Record the current time
       
         
        Mode2UI();
       //
       
       //
       
       if(controlMode == 1){
         //
        if(level == 0 ){
        locationy = locationy + g +a ;
        }else if(level == 1 || level == 2){
        keystop();
        }
        
       }
       //
       if(controlMode == 2){
         //
       locationy = mouseY ;
       }
       
       fill(255,0,0);
       if(a==-2*g){
        fill(0,255,0); 
       }
       //BOX2D   ellipse(locationx,locationy,r,r); 
       imageMode(CENTER);
       image(plane,locationx+110,locationy,300 ,r);
       ellipse(locationx-100,locationy,20,20);//指示灯

       //
       
       if(runningtime >= (Presstime+750) ){
         //
        a = 0 ; 
        press =false ;
       }
       //
       rectMode(CENTER);
       fill(255,0,0,50);
       killx = locationx+500;
       killy = locationy+50 ;
       if(runningtime - killtime >=2000){
       fill(0,0,255,50);
 }
       rectMode(CENTER);
       rect(killx,killy,200,2000);
       if(key == 'c'){
         if(runningtime - killtime >=2000){
         attack.rewind();
         attack.pause();
         attack.play(); 
         fill(150,150,200);
         rect(killx,killy,200,2000);
         killtime = millis();
         if(arrayenemy[countenemy]<= killx +100 && arrayenemy[countenemy] >= killx-100){
            score =score+50;
           fadeenemy = true ;
         }
         }
       }
       if(runningtime - killtime >=2000){
         fadeenemy = false ; 
       }
       
       
       
       //
          
       
       //Columnar movement
       fill(125,125,125);
       if((runningtime - recttime)>6000 ||(arrayrectx[countrect]+rectwidth)==0){
         //Fresh Random
          countrect++ ;
          randomhight[countrect]=random(200,700);
          recttime = millis();
          drawrect = true ; //
       }
       
       if(drawrect == true){
       
        arrayrectx[countrect] = arrayrectx[countrect]+rectmove ; 
        //rect(arrayrectx[countrect],0,rectwidth,randomhight[countrect]);
        //rect(arrayrectx[countrect],(distance+randomhight[countrect]),rectwidth,(1000-randomhight[countrect]-distance));  
        imageMode(CORNER);
        image(zhangai,arrayrectx[countrect],0,rectwidth,randomhight[countrect]);
        image(zhangai,arrayrectx[countrect],(distance+randomhight[countrect]),rectwidth,(1000-randomhight[countrect]-distance));
       }
   
       
       
       if((runningtime - timeOfenemy)>enemytime) {
      //enemy fresh
      countenemy++ ;
      enemyhight[countenemy]=random(100,900);
      timeOfenemy = millis();
      drawenemy = true ;
    }
    if(drawenemy == true &&fadeenemy == false){
        arrayenemy[countenemy] = arrayenemy[countenemy]+enemymove ; 
        fill(125,125,125);
        image(enemy,arrayenemy[countenemy],enemyhight[countenemy],enemyr,enemyr);
    }
         
       
     
        if(fadeenemy == false){       
        if(locationx <= (arrayenemy[countenemy]+enemyr) && locationx>=(arrayenemy[countenemy]-enemyr)){
          if((locationy-r)>=(enemyhight[countenemy]+enemyr)  ||(locationy+r)<=(enemyhight[countenemy]-enemyr) ){
          scoreg++;
          }else{ 
            drawenemy = false ;
            arrayenemy[countenemy] = -1000;
             error.rewind();
             error.pause();
             error.play(); 
            hp -- ; 
           background(0,0,0);
          }

        }
        }
       
        if((arrayrectx[countrect]-2*r) <= (locationx - r) && (locationx - r) <= (arrayrectx[countrect]+rectwidth))
        {
         //
         if((locationy-r)>=(randomhight[countrect]-judge) && (randomhight[countrect]+distance) >= ((locationy +r) -judge))
         {
          //
         textSize(100);
         text(scoreg,locationx+30,locationy-30);
         ok.rewind();
         ok.pause();
         ok.play(); 
         scoreg++;
      
         }else{
         error.rewind();
         error.pause();
         error.play(); 
          hp -- ; 
          arrayrectx[countrect] = -100 ;
         }        
        }
        

            
       //
       
       
       //
       if(countrect == 18){
         countrect = 0 ;
         for (int i = 0 ; i <= 19 ; i++ )
      {
      arrayrectx[i] = 1000 ;
      }
       }
       
       //
           if(countenemy == 18){
             countenemy= 0 ;
             for (int i = 0 ; i <= 19 ; i++ )
          {
          arrayenemy[i] = 1000 ;
          }
           }
       
       
       //
       if(locationy>(1000-r) ){
         hp -- ;  
         //locationy =200;  
         a = -2*g ; 
         Presstime  = millis();
         press =true ;
       }
        if(locationy<(r) ){
         hp -- ;  
         //locationy =200; 
         a = 5 ;
        //       
       }
       
      

       
       
       
              
       //
       scoret = (runningtime-savetime)/1000;
       if(level == 2){
         score = (scoret +scoreg/5)*2;
       }else score =  scoret +scoreg/5 ; 
    }
    //
      
     
      
      
//screenMode3
 if(screenMode == 3){ 
    background(0,0,0);
    end1.play();
    
    imageMode(CORNER);
    image(end,0,-50);
    
    fill(255.255,255);
    textSize(40);
    text("The time you passed is " + scoret+" s" ,650,300);    
    textSize(40);
    text("The score you got  is " + score+" points" ,650,400);
    
    textSize(80);
    text("Game Over!",370,150);
    
    //exit
    textSize(30);
    text("Take e to exit the game",230,300);
    if(exit == true){
     end1.rewind();
     end1.pause();
    exit();
    }    
    //restart
    textSize(30);
    text("Take r to restart the game",230,375);    
    if(restart == true){
     regame();
     end1.rewind();
     end1.pause();
     screenMode = 2 ; 
    }
    //back to menu
    textSize(30);
    text("Take b to back the menu",230,450);
    if(backmenu == true){
     regame();//
     end1.rewind();
     end1.pause();
     screenMode = 0 ;// 
    }
    
  }
  
 
 
 
 if(timesave == true){
  savetime = millis();
  timesave = false ; 
 }
 
 
 if(score >= 150) {
   part = 1 ;
   difficulty(-6,11,280,-25) ; 
 }
 
  if(score >= 300) {
   part = 2 ;
   difficulty(-8,13,250,-30) ; 
 }
   if(score >= 500) {
   part = 3 ;
   difficulty(-10,15,250,-40) ; 
 }
   
   if(score >= 700) {
   part = 4 ;
 }
 

 if(scoret >=hptime ) {
  hpplus.pause();
  hpplus.rewind();
  hpplus.play() ; 
      
   hp++;
   hptime = scoret + hptime ; 
 }
 
      
}
//


 void keyPressed(){
   
      if(key == ' '){
        
        if(press == false){
       a = -2*(g);  
       Presstime  = millis();
       press =true ; 
       keystop = false ;
       }else{
          a = 0 ; 
          press =false ;
        }
      }
      
      if(key == 'e'){
        exit = true ; 
      }
      if(key == 'r'){
        restart = true ; 
      }
      if(key == 'b'){
        backmenu = true ; 
      }
      if(key == '1'){
         getcontrol = 1 ; 
      }
      if(key == '2'){
         getcontrol = 2 ;
      }
      if(key == 'g'){
         getstart = true ;  
      }
      if (key == 'l'){
        part++;
      }

      
    
   }
   
  
  void regame(){
    //重置游戏
     locationy = 200 ; 
     locationx = 150 ;
     score  = 0 ; 
     scoret = 0 ; 
     scoreg = 0 ; 
     hp = 10 ;
     getcontrol = 0 ; 
     getstart = false ;  
     exit = false ; 
     restart = false ; 
     drawrect = false;
     backmenu = false ; 
     timesave = true ;
     bgm1p = false ; 
     level = 1 ;
     g =10;
     a = 0 ;
     part = 0 ;
     rectmove = -5 ;
     distance = 300 ;
     enemytime =2000;
     enemymove =-20 ; 
     enemyr = 80 ;
  }
  
  void Mode2UI(){
    //游戏场景UI设计
   rectMode(CORNER);
   fill(125,125,125);
   rect(1000,0,300,1000);
   
   fill(255,255,255);
   textSize(65);
   text("Pionts:",1000,100);

   textSize(65);
   text("Time:",1000,300);
   
   textSize(65);
   text("Level:",1000,500);
   
   textSize(50);
   text(score,1050,200);
   
   textSize(50);
   text(scoret,1050,400);  
   
   textSize(60);
   if(level == 0) text("EZ",1050,600);  
   if(level == 1 )text("Normal",1050,600);
   if(level == 2) text("Legend",1050,600);  
   
   HP();
  }
  
  void HP(){
    //HP可视化系统
   fill(255,0,0);
   int HPy = 700;
   int HPyy = HPy+100;
   int HPSize = 30 ;
   imageMode(CENTER);
   image(HPUI,1050,650,100,70);
   
   if(hp>=1) image(HP,1050,HPy,HPSize,HPSize); 
   if(hp>=2) image(HP,1100,HPy,HPSize,HPSize); 
   if(hp>=3) image(HP,1150,HPy,HPSize,HPSize); 
   if(hp>=4) image(HP,1200,HPy,HPSize,HPSize); 
   if(hp>=5) image(HP,1250,HPy,HPSize,HPSize); 
   if(hp>=6) image(HP,1050,HPyy ,HPSize,HPSize); 
   if(hp>=7) image(HP,1100,HPyy,HPSize,HPSize); 
   if(hp>=8) image(HP,1150,HPyy,HPSize,HPSize); 
   if(hp>=9) image(HP,1200,HPyy,HPSize,HPSize); 
   if(hp>=10)image(HP,1250,HPyy,HPSize,HPSize); 
  }
  
  void keystop(){
   //键盘操控时的瞬停系统
       if(key=='z' ){
         keystop = true;      
        }else if(key == 'x'){keystop = false ;} 
     
     if(keystop == true){
       locationy = locationy ; 
     }else {
       locationy = locationy + g +a ;
     }
   } 
  void mainMenu(){
   //主界面设计  
   imageMode(CENTER);
   image(fly,650,500);
   fill(255,255,255);
   textSize(100);
   text("Dream  Of  Flying",250,300);  
   //开始
   ellipsePressed(500,600,150,12);//按下按钮，切换至难度选择界面 
   imageMode(CENTER);
   image(enter,500,600,150,150);
   
   //教程
   ellipsePressed(800,600,150,11);//按下按钮，切换至新手教程界面
   imageMode(CENTER);
   image(newhere,800,600,150,150);
   }
     
 void ellipsePressed(int xe ,int ye,int re,int modee){
   //按钮触发模组
  fill(255,255,255);
   ellipse(xe,ye,re,re);
   //
   if(mouseX>=(xe-re)&&mouseX<=(xe+re)&&mouseY>=(ye-re)&&mouseY<=(ye+re)){

   fill(125,125,125);
   ellipse(xe,ye,re,re);
   if(mousePressed){ 
   anniu.rewind();
   anniu.pause();
     screenMode = modee ;
      anniu.play();
   }
    }
 }
 
 void rectPressed(int xr,int yr,int rx ,int ry,int moder){
  //方形按钮判定模组(X,Y，长，宽，模式)
  rectMode(CENTER);
  fill(255,255,255);
  rect(xr,yr,rx,ry);
 if(mouseX>=(xr-rx/2)&&mouseX<=(xr+rx/2)&&mouseY>=(yr-ry/2)&&mouseY<=(yr+ry/2)){
 fill(125,125,125);
 rect(xr,yr,rx,ry);
 if(mousePressed){ 
 screenMode = moder ;
 anniu.rewind();
 anniu.pause();
 anniu.play();
  }
    }
 }
 
 void difficulty(int a,int b,int c,int d){
   //矩形移动速度，小球速度，矩形间距，敌人移速
   rectmove = a;
   g = b ; 
   distance = c ;
   enemymove = d ; 
   
 }
