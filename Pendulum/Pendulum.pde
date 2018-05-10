PVector origin;
PVector bob;

float len;
float angle = PI/2;

float angular_acc = 0;
float angular_vel = 0;

float hit_up = 0.1;

int score = 0;

void setup()
{
  size(640, 360);

  len = 150;
  origin = new PVector(0, 0);
  bob = new PVector(0, len);
}

void mouseClicked()
{
  angular_vel += hit_up * sin(angle);
  len -= 1;
}

void draw()
{
  background(255);
  translate(320, 180);
    
  bob.x = origin.x + len * sin(angle);
  bob.y = origin.y + len * cos(angle);
  
  line(origin.x, origin.y, bob.x, bob.y);
  ellipse(bob.x, bob.y, 5, 5);
  stroke(255, 0, 0);
  point(bob.x, bob.y);
  
  angular_acc = -0.01 * sin(angle);
  
  angle += angular_vel;
  angular_vel += angular_acc;
  
  angular_vel *= 0.985;
}
