// this is the radar class to make the radars
class Radar
{
  float rx, ry, r, theta, speed, freq;
  color c;
  
  Radar(float rx, float ry, float r, float freq, color c)
  {
    this.rx = rx;
    this.ry = ry;
    this.r = r;
    this.freq = freq;
    this.speed = (PI / 60.0) * freq;
    this.theta = 0;
    this.c = c;
  }
  
  // this updates increaments theta rotatation of the radar
  void update()
  {
    theta += speed;
  }
  
  // This draws the radar itself
  void render()
  {
    strokeWeight(1);
    stroke(0, 110, 255);

    // this draws the overall circle of the radar
    fill(0);
    ellipse(rx, ry, r*2, r*2);
    
    // This draw the two lines inside the radar
    noFill();
    line(rx, ry + r, rx, ry - r);
    line(rx + r, ry, rx - r, ry);
    
    // this draws the inner circles isnde the radar
    float innerCircles = r/2;
    for(int i = 0; i < 5; i++)
    {
      ellipse(rx, ry, innerCircles*i , innerCircles*i);
    }
    
    // This draws the the roatating line of the rardar along with the smooth trail behind it
    int trailLength = 30;
    float cIntensity = 255 / (float)trailLength;
    for(int i = 0; i < trailLength; i++)
    {
     strokeWeight(5);
     stroke(0, 110, 255,i * cIntensity);
     float x = rx + sin(theta + i * speed) * r;
     float y = ry -cos(theta + i * speed) * r;
     line(rx, ry, x, y);
    }
    
  }
  
}