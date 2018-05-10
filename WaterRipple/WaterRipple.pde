
int cols = 1000;
int rows = 1000;
float[][] current = new float[cols][rows];
float[][] previous = new float[cols][rows];

float damping = 0.9;

void setup() {
  size(1000, 1000);
}

void mousePressed() {
  previous[mouseX][mouseY] = 255;
}

void draw() {
  background(0);
  loadPixels();
  
  for (int i = 1; i < cols - 1; i++)
  {
    for (int j = 1; j < rows - 1; j++)
    {
      current[i][j] = (previous[i-1][j] +
                       previous[i+1][j] +
                       previous[i][j+1] +
                       previous[i][j-1]) / 2 - current[i][j];
      current[i][j] = current[i][j] * 0.99;
      int index = i + j * cols;
      pixels[index] = color(current[i][j] * 255);
    }
  }
  
  updatePixels();
  
  float[][] temp = previous;
  previous = current;
  current = temp;
}
