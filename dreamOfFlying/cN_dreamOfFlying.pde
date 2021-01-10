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


int savetime = 0 ;//记录点时间
boolean timesave = false ; //只有当它为ture时才会更新savetime的值
int runningtime ; //运行总时间
int Presstime ; //点击记录时，每次点击鼠标时更新
int controlMode = 1 ; //控制模式，1是键盘，2是鼠标
int getcontrol = 0;  //对应的，1是键盘，2是鼠标，0是缓冲状态
boolean keystop = false ; //键盘操作独有的停顿模式
int screenMode = 0 ; //场景控制系统
//0.游戏主界面 1.控制选择界面 11.新手教程界面 12.难度控制界面 131/132.专属于Normal和High的开始界面 2.游戏界面  3.结算界面
int hp = 10; //定义一个生命值，初始为10
int hptime = 10 ;//hp回复时间
boolean rehp = false ;
int level = 1 ; //0 EZ  1 NORMAL   2 HIGHEST
int part = 0; //难度区分，以后可能的话会是关卡区分


boolean exit = false ; 
boolean restart = false ;
boolean getstart = false ;
boolean backmenu = false ; 
boolean bgm1p = false ; 


int score  = 0 ; //总得分
int scoret = 0 ; //持续时间得分
int scoreg = 0 ; //通过个数得分

boolean press = false;

int locationx = 150 ; 
int locationy = 200 ; 
int r = 75 ; //小球半径
int a = 0 ; //向上加速度 
int g = 10 ; //向下加速度
int killx = 0;//可进行消除的矩形的判定 
int killy = 0;
int killtime ; //击杀计时器，触发一次击杀更新一次

//int []bulletx = new int[30];//子弹库x
//int []bullety = new int[30];//子弹库y
//int bulletcount = 0 ;
     
int rectmove = -5 ;//矩形移速,绝对值越大难度越大
int distance = 300 ;//两矩形间隔
int rectwidth = 100 ; //矩形宽度
int recttime = 0 ; //出现间隔时间
boolean drawrect = false ; //是否允许绘画 
int [] arrayrectx = new int [20];//矩形x数组
int countrect =0 ; //矩形计数器
float [] randomhight = new float[20];//随机高度数组
int judge = 30 ; //判定区域修补，数值越大难度越大 30大概是最正常的

int enemytime =2000; //敌人出现间
int [] arrayenemy = new int [20];//敌人数量矩阵
float [] enemyhight = new float [20]; //敌人飞行高度矩阵
int countenemy ; //敌人计数器
int timeOfenemy ; //敌人计时器
int  enemymove =-20 ;//敌人速度
int  enemyr = 80 ; //敌人半径
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
  //初始界面  screenMode 0
if(screenMode == 0){
 background(0,0,0);
 fill(225,225,225);
 menu.play();
 mainMenu();
}
  
  
//控制选择界面 screenMode1
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
    //如果选择键盘输入
    controlMode = 1 ; 
    screenMode = 2 ;
    getcontrol = 0 ;
    timesave =true ; 
  }
   }
 
  if(getcontrol == 2){
   //如果选择鼠标输入
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





//新手教程界面
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
   //难度选择界面 
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
    
  
  
  
//游戏界面 screenMode2  
 if(screenMode == 2){
        //生命系统
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
        image(game1,750,500);//设置背景
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
      

      
      
       runningtime  = millis() ;  //记录当前的时间
       
        //右侧UI区 
        Mode2UI();
       //
       
       //小球运动
       
       if(controlMode == 1){
         //键盘控制模式
        if(level == 0 ){
        locationy = locationy + g +a ;
        }else if(level == 1 || level == 2){
        keystop();
        }
        
       }
       //
       if(controlMode == 2){
         //鼠标控制模式
       locationy = mouseY ;
       }
       
       fill(255,0,0);
       if(a==-2*g){
        fill(0,255,0); 
       }
       //碰撞箱   ellipse(locationx,locationy,r,r); 
       imageMode(CENTER);
       image(plane,locationx+110,locationy,300 ,r);
       ellipse(locationx-100,locationy,20,20);//指示灯

       //
       
       if(runningtime >= (Presstime+750) ){
         //进行一次是否恢复下降状态的判定
        a = 0 ; 
        press =false ;
       }
       //击杀敌人判定
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
          
       
       //柱状移动
       fill(125,125,125);
       if((runningtime - recttime)>6000 ||(arrayrectx[countrect]+rectwidth)==0){
         //随机刷新器
          countrect++ ;
          randomhight[countrect]=random(200,700);
          recttime = millis();
          drawrect = true ; //刷新绘画rect状态
       }
       
       if(drawrect == true){
        //如果允许绘画
        //rect碰撞箱
        //rectMode(CORNER);
        arrayrectx[countrect] = arrayrectx[countrect]+rectmove ; 
        //rect(arrayrectx[countrect],0,rectwidth,randomhight[countrect]);
        //rect(arrayrectx[countrect],(distance+randomhight[countrect]),rectwidth,(1000-randomhight[countrect]-distance));  
        imageMode(CORNER);
        image(zhangai,arrayrectx[countrect],0,rectwidth,randomhight[countrect]);
        image(zhangai,arrayrectx[countrect],(distance+randomhight[countrect]),rectwidth,(1000-randomhight[countrect]-distance));
       }
       // 柱状移动写完了，真是个大工程 
       
       //敌人移动
       if((runningtime - timeOfenemy)>enemytime) {
      //enemy刷新
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
         
       
       //碰撞判定
               //敌人碰撞
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
         //检测到球已经进入判定区域
         if((locationy-r)>=(randomhight[countrect]-judge) && (randomhight[countrect]+distance) >= ((locationy +r) -judge))
         {
          //进行“通过”的判定
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
       
       
       //矩形数组刷新
       if(countrect == 18){
         countrect = 0 ;
         for (int i = 0 ; i <= 19 ; i++ )
      {
      arrayrectx[i] = 1000 ;
      }
       }
       
       //敌人数组刷新
           if(countenemy == 18){
             countenemy= 0 ;
             for (int i = 0 ; i <= 19 ; i++ )
          {
          arrayenemy[i] = 1000 ;
          }
           }
       
       
       //上下边界判定
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
       
      

       
       
       
              
       //计算分
       scoret = (runningtime-savetime)/1000;
       if(level == 2){
         score = (scoret +scoreg/5)*2;
       }else score =  scoret +scoreg/5 ; 
    }
    //Mode2由此结束
      
     
      
      
//结算界面screenMode3
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
    
    //退出游戏
    textSize(30);
    text("Take e to exit the game",230,300);
    if(exit == true){
     end1.rewind();
     end1.pause();
    exit();
    }    
    //重开
    textSize(30);
    text("Take r to restart the game",230,375);    
    if(restart == true){
     regame();
     end1.rewind();
     end1.pause();
     screenMode = 2 ; 
    }
    //返回菜单
    textSize(30);
    text("Take b to back the menu",230,450);
    if(backmenu == true){
     regame();//重置游戏
     end1.rewind();
     end1.pause();
     screenMode = 0 ;//返回菜单  
    }
    
  }
  
 //持续运行区域
 
 //计数器更新器
 if(timesave == true){
  savetime = millis();
  timesave = false ; 
 }
 
 //难度更新器
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
 
 //hp转化器
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
    //键盘点击时，进行判断
      if(key == ' '){
        //如果敲得是空格
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
   
  //整理区
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
