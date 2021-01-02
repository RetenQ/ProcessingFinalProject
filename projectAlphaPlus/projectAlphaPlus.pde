int savetime = 0 ;//记录点时间
boolean timesave = false ; //只有当它为ture时才会更新savetime的值
int runningtime ; //运行总时间
int Presstime ; //点击记录时，每次点击鼠标时更新
int controlMode = 1 ; //控制模式，1是键盘，2是鼠标
int getcontrol = 0;  //对应的，1是键盘，2是鼠标，0是缓冲状态
boolean keystop = false ; //键盘操作独有的停顿模式，方式是按x
int screenMode = 0 ; //场景控制系统
//0.游戏主界面 1.控制选择界面 11.新手教程界面  2.游戏界面  3.结算界面
int hp = 50000 ; //定义一个生命值，初始为5

boolean exit = false ; 
boolean restart = false ;
boolean getstart = false ;
boolean backmenu = false ; 


int score  = 0 ; //总得分
int scoret = 0 ; //持续时间得分
int scoreg = 0 ; //通过个数得分

boolean press = false;

int locationx = 150 ; 
int locationy = 200 ; 
int r = 75 ; //小球半径
int a = 0 ; //向上加速度 
int g = 10 ; //向下加速度

int rectmove = -20 ;//矩形移速,绝对值越大难度越大
int distance = 300 ;//两矩形间隔
int rectwidth = 100 ; //矩形宽度
int recttime = 0 ; //出现间隔时间
boolean drawrect = false ; //是否允许绘画 
int [] arrayrectx = new int [30];//矩形x数组
int countrect =0 ; //矩形计数器
float [] randomhight = new float[30];//随机高度数组
int judge = 30 ; //判定区域修补，数值越大难度越大 30大概是最正常的


void setup() {
size(1300,1000);
for (int i = 0 ; i <= 18 ; i++ )
{
arrayrectx[i] = 1000 ;
}

}

void draw(){
  frameRate(60);
  //初始界面  screenMode 0
if(screenMode == 0){
 background(0,0,0);
 fill(225,225,225);
 mainMenu();
}
  
  
//控制选择界面 screenMode1
if(screenMode == 1){
 background(0,0,0);
 fill(225,225,225);
 textSize(60);
 text("Choose your control",250,500);
 text("1-use keyboard ; 2-use mouse. ",150,600);
 
 
 if(getcontrol == 1){
   //如果选择键盘输入
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
  text("Normal: Default Level,Only use keyboard to control,\n             pressed ‘space’to jump,when jumping pressed to fall\n             Pressed the LEFT '<-' to stop\n             and pressed RIGHT'->' to recovery",0,750);
  text("Higest: Faster,More enemy,MORE POINTS aw well!",0,975);
  
   fill(225,225,225);
   int xe = 1100 ;
   int ye = 900;
   ellipse(xe,ye,150,150);
   //！！！插入教程的素材，xy和圆一样就行
   if(mouseX>=(xe-150)&&mouseX<=(xe+150)&&mouseY>=(ye-150)&&mouseY<=(ye+150)){
   fill(125,125,125);
   ellipse(xe,ye,150,150);  
   if(mousePressed){ 
     screenMode = 0 ;
   }
   }
  
} 
  

  if(screenMode == 12){
    levelmenu(); 
  }
  
  
//游戏界面 screenMode2  
 if(screenMode == 2){
        //生命系统
        if(hp==0){
          exit = false ;
          restart = false;
          screenMode = 3 ; 
        }
        
       background(255,255,255); //设置背景
       runningtime  = millis() ;  //记录当前的时间
       
        //右侧UI区 
        Mode2UI();
       //
       
       //小球运动
       
       if(controlMode == 1){
         //键盘控制模式
        // locationy = locationy + g +a 
        keystop();
        
       }
       //
       if(controlMode == 2){
         //鼠标控制模式
       locationy = mouseY ;
       }
       
       fill(255,0,0);
       if(a==-20){
        fill(0,255,0); 
       }
       ellipse(locationx,locationy,r,r); 
       //
       
       if(runningtime >= (Presstime+750) ){
         //进行一次是否恢复下降状态的判定
        a = 0 ; 
        press =false ;
       }
       
       //柱状移动
       fill(125,125,125);
       if((runningtime - recttime)>3000 ||(arrayrectx[countrect]+rectwidth)==0){
         //随机刷新器
          countrect++ ;
          randomhight[countrect]=random(200,700);
          recttime = millis();
          drawrect = true ; //刷新绘画rect状态
       }
       
       if(drawrect == true){
        //如果允许绘画
        arrayrectx[countrect] = arrayrectx[countrect]+rectmove ; 
        rect(arrayrectx[countrect],0,rectwidth,randomhight[countrect]);
        rect(arrayrectx[countrect],(distance+randomhight[countrect]),rectwidth,(1000-randomhight[countrect]-distance)); 
       }
       // 柱状移动写完了，真是个大工程 
       
       //碰撞判定
        if((arrayrectx[countrect]-2*r) <= (locationx - r) && (locationx - r) <= (arrayrectx[countrect]+rectwidth))
        {
         //检测到球已经进入判定区域
         if((locationy-r)>=(randomhight[countrect]-judge) && (randomhight[countrect]+distance) >= ((locationy +r) -judge))
         {
          //进行“通过”的判定
         textSize(100);
         text(scoreg,200,500);
         scoreg++;
      
         }else{
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
       
       
       //上下边界判定
       if(locationy>(1000-r) ){
         hp -- ;  
         //locationy =200;  
         a = -20 ; 
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
       score =  scoret +scoreg/5 ; 
    }//Mode2由此结束
      
     
      
      
//结算界面screenMode3
 if(screenMode == 3){ 
    background(0,0,0);
    
    textSize(30);
    text("The time you passed is " + scoret+" s" ,650,500);    
    
    textSize(30);
    text("The score you got  is " + score+" points" ,650,600);
    
    
    textSize(50);
    text("Game Over!",250,500);
    
    textSize(20);
    text("Take e to exit the game",250,600);
    if(exit == true){
    exit();
    }
    
    textSize(20);
    text("Take r to restart the game",250,650);
    
    if(restart == true){
     regame();
     screenMode = 2 ;
     
    }
    
    textSize(20);
    text("Take b to back the menu",250,700);
    if(backmenu == true){
     regame();//重置游戏
     screenMode = 1 ;//返回菜单
     
    }
    
  }
  
 //持续运行区域
 
 //计数器更新器
 if(timesave == true){
  savetime = millis();
  timesave = false ; 
 }

      
}
//


 void keyPressed(){
    //键盘点击时，进行判断
      if(key == ' '){
        //如果敲得是空格
        if(press == false){
       a = -20 ;  
       Presstime  = millis();
       press =true ; 
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
      
    
   }
   
  //整理区
  void regame(){
    //重置游戏
     locationy = 200 ; 
     locationx = 150 ;
     score  = 0 ; 
     scoret = 0 ; 
     scoreg = 0 ; 
     hp = 3 ;
     getcontrol = 0 ; 
     getstart = false ;  
     exit = false ; 
     restart = false ; 
     drawrect = false;
     backmenu = false ; 
     timesave = true ;
  }
  
  void Mode2UI(){
    //游戏场景UI设计
   fill(0,0,150);
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
   text("Normal",1050,600);  
   
   HP();
  }
  
  void HP(){
    //HP可视化系统
   fill(255,0,0);
   int HPy = 700;
   int HPSize = 30 ;
   if(hp>=1) ellipse(1050,HPy,HPSize,HPSize); 
   if(hp>=2) ellipse(1100,HPy,HPSize,HPSize); 
   if(hp>=3) ellipse(1150,HPy,HPSize,HPSize); 
   if(hp>=4) ellipse(1200,HPy,HPSize,HPSize); 
   if(hp>=5) ellipse(1250,HPy,HPSize,HPSize); 
  }
  
  void keystop(){
   //键盘操控时的瞬停系统
       if(keyCode == LEFT ){
         keystop = true;      
        }else if(keyCode == RIGHT){keystop = false ;} 
     
     if(keystop == true){
       locationy = locationy ; 
     }else {
       locationy = locationy + g +a ;
     }
  }  
  void mainMenu(){
   //主界面设计
   int r1 =150 ; 
   int y1 = 600;
   int x1 = 500; 
   int x2 = 800;
   
   textSize(100);
   text("M.A.I.N",450,300);
   
   //开始
   fill(255,255,255);
   ellipse(x1,y1,r1,r1);
   //！！！插入开始的素材，xy和圆一样就行
   if(mouseX>=(x1-r1)&&mouseX<=(x1+r1)&&mouseY>=(y1-r)&&mouseY<=(y1+r)){
   fill(125,125,125);
   ellipse(x1,y1,r1,r1);
   if(mousePressed){ 
     screenMode = 12 ;
   }
   }
   
   //教程
   fill(255,255,255);
   ellipse(x2,y1,r1,r1);
   //！！！插入教程的素材，xy和圆一样就行
   if(mouseX>=(x2-r1)&&mouseX<=(x2+r1)&&mouseY>=(y1-r)&&mouseY<=(y1+r)){
   fill(125,125,125);
   ellipse(x2,y1,r1,r1);  
   if(mousePressed){ 
     screenMode = 11 ;
   }
   }
    
  }
 
 
 void levelmenu(){
   background(0,0,0);
   
 }
