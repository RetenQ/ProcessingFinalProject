int savetime = 0 ;//记录点时间
boolean timesave = false ; //只有当它为ture时才会更新savetime的值
int runningtime ; //运行总时间
int Presstime ; //点击记录时，每次点击鼠标时更新
int controlMode = 1 ; //控制模式，1是键盘，2是鼠标
int getcontrol = 0;  //对应的，1是键盘，2是鼠标，0是缓冲状态
int screenMode = 2 ; //场景控制系统
//1.主界面  2.游戏界面  3.结算界面
int hp = 3 ; //定义一个生命值，初始为3

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

int rectmove = -3 ;//矩形移速
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
//主界面 screenMode1
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
       fill(0,0,150);
       rect(1000,0,300,1000);
       //
       
       //小球运动
       
       if(controlMode == 1){
         //键盘控制模式
       locationy = locationy + g +a ; 
       }
       
       if(controlMode == 2){
         //鼠标控制模式
       locationy = mouseY ;
       }
       
       fill(255,0,0);
       ellipse(locationx,locationy,r,r); 
       //
       
       if(runningtime >= (Presstime+750) ){
         //进行一次是否恢复下降状态的判定
        a = 0 ; 
        press =false ;
       }
       
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
       
       
       //打印分
       scoret = (runningtime-savetime)/1000;
       score =  scoret +scoreg/5 ; 
       textSize(100);
       text(score,500,500);
       
       textSize(100);
       text(hp,700,500);  
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
     screenMode = 2 ;
     
    }
    
    textSize(20);
    text("Take b to back the menu",250,700);
    if(backmenu == true){
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
     screenMode = 1 ;
     
    }
    
  }
  
 //持续运行区域
 if(timesave == true){
  savetime = millis();
  timesave = false ; 
 }

      
}



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
    
  }
 
