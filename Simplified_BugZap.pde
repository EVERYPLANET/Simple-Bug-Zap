void setup() {
  size(500,500);
  rectMode(CENTER);
  
  w = 50;
  r = w/2;
  x = random(w,width-w);
  y = height-w;
  
  bW = 50;
  bR = bW/2;
  bX = random(5 + bW, width - bW);
  bY = 5 + bW;
  bDir = 1;

}

float x,y;
float w,r;
float bX,bY,bW,bR,bDir;
int score;
float speed = 30;
boolean endScreen = false;

void drawPlayer(float x,float y){
  rect(x,y,w,w/1.3);
  line(x,y-(w/1.3)/2,x,y+(w/1.3)/2);
}

void drawBug(float x, float y){
  circle(x,y,bR);
}

void moveBug(){
  if (bX >= width-bW || bX <= 0+bW){
    bY += bW;
    bDir *= -1;
    speed /= 1.4;
  }
  if (bY > height - bW){
    endScreen = true;
  }
  bX += bDir * 30;
}

void movePlayer(){
  if(keyPressed){
    if (keyCode == LEFT && !(x<r)){
        x -= 2;
    }
    else if(keyCode == RIGHT && !(x>width-r)){
        x += 2;
    }
    
    
    if(key == ' '){
      line(x,y,x,0);
      if(dist(bX,bY,x,bY)<=bR/2){
        bX = random(5 + bW, width - bW);
        bY = 5 + bW;
        score += 1;
        speed = 30;
      }
    }
  }
}

void draw() {
  background(255);
  
  if(endScreen){
    fill(0);
    textSize(60);
    text("You Lost!",width/3, height/3);
    textSize(30);
    text("Score: " + score, width/3,height/2);
    
  }else{
    fill(0);
    textSize(20);
    text("Score: "+ score,10, 20); 
    fill(255);
    movePlayer();
    drawPlayer(x,y);
    drawBug(bX,bY);
    
    if(frameCount % round(speed) == 0){
      moveBug();
    }
    if(frameCount % 70 == 0){
      bY += bW;
    }
  }
}
