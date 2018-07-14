int[][] grid;
int  rows;
int  cols;
int  resolution = 2;

int  pause = 1;
int  glider = 0;

void  setup()
{
  size(1200, 600);
  rows = height / resolution;
  cols = width / resolution;
  grid = new int[rows][cols];
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j] = 0;
    }
  }
}

void  draw()
{
  background(231);
  
  int[][] tmp = new int[rows][cols];
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int y = i * resolution;
      int x = j * resolution;
      int state = grid[i][j];
      if (state == 1) {
        fill(51);
        noStroke();
        rect(x, y, resolution, resolution);
      }
      if (pause == 0) { 
        int neighbors = count_neighbors(grid, j, i);
        if (state == 0 && neighbors == 3) {
          tmp[i][j] = 1;
        } else if (state == 1 && (neighbors < 2 || neighbors > 3)) {
          tmp[i][j] = 0;
        } else {
          tmp[i][j] = state;
        }
      }
    }
  }
  if (pause == 0) {
    grid = tmp;
  }
}


void keyPressed()
{
  if (key == ' ') {
      if (pause == 1) {
          pause = 0;
      } else {
        pause = 1;
      }
    }
  if (key == 'a') {
    glider++;
    if (glider > 3) {
      glider = 0;
    }
    print(glider);
  }
  
  if (key == 'c') {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
         grid[i][j] = 0;
      }
    }
  }
  
  
}

void mousePressed()
{
  if (pause == 1 || pause == 0) {
   int x = mouseX / resolution;
   int y = mouseY / resolution;
   if (glider == 3) {
     grid[y][x] = 1;
     grid[(y-1+rows) % rows][x] = 1;
     grid[(y-2+rows) % rows][x] = 1;
     grid[(y+1+rows) % rows][(x-2 + cols) % cols] = 1;
     grid[(y+2+rows) % rows][(x-2 + cols) % cols] = 1;
     grid[(y+2+rows) % rows][(x-4 + cols) % cols] = 1;
     grid[(y-1+rows) % rows][(x+2 + cols) % cols] = 1;
     grid[(y-2+rows) % rows][(x+2 + cols) % cols] = 1;
     grid[(y-2+rows) % rows][(x+3 + cols) % cols] = 1;
     grid[(y-3+rows) % rows][(x+2 + cols) % cols] = 1;
   } else if (glider == 2) {
     grid[(y+rows) % rows][(x + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-1 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-2 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-6 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-7 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-8 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-9 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-10 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-12 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-13 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-14 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-15 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-16 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-17 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-18 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-19 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x+7 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x+8 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x+9 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x+10 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x+11+ cols) % cols] = 1;
     grid[(y+rows) % rows][(x+12+ cols) % cols] = 1;
     grid[(y+rows) % rows][(x+13+ cols) % cols] = 1;
     grid[(y+rows) % rows][(x+15 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x+16+ cols) % cols] = 1;
     grid[(y+rows) % rows][(x+17+ cols) % cols] = 1;
     grid[(y+rows) % rows][(x+18+ cols) % cols] = 1;
     grid[(y+rows) % rows][(x+19+ cols) % cols] = 1;
   } else if (glider == 1) {
     grid[(y+rows) % rows][(x + cols) % cols] = 1;
     grid[(y+1+rows) % rows][(x-1 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-1 + cols) % cols] = 1;
     grid[(y-1+rows) % rows][(x-1 + cols) % cols] = 1;
     grid[(y-2+rows) % rows][(x-2 + cols) % cols] = 1;
     grid[(y+2+rows) % rows][(x-2 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-3 + cols) % cols] = 1;
     grid[(y+3+rows) % rows][(x-4 + cols) % cols] = 1;
     grid[(y+3+rows) % rows][(x-5 + cols) % cols] = 1;
     grid[(y-3+rows) % rows][(x-4 + cols) % cols] = 1;
     grid[(y-3+rows) % rows][(x-5 + cols) % cols] = 1;
     grid[(y+2+rows) % rows][(x-6 + cols) % cols] = 1;
     grid[(y-2+rows) % rows][(x-6 + cols) % cols] = 1;
     grid[(y+1+rows) % rows][(x-7 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-7 + cols) % cols] = 1;
     grid[(y-1+rows) % rows][(x-7 + cols) % cols] = 1;
     grid[(y-1+rows) % rows][(x-16 + cols) % cols] = 1;
     grid[(y-1+rows) % rows][(x-17+ cols) % cols] = 1;
     grid[(y+rows) % rows][(x-16 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x-17 + cols) % cols] = 1;
     grid[(y-2+rows) % rows][(x+18 + cols) % cols] = 1;
     grid[(y-2+rows) % rows][(x+17+ cols) % cols] = 1;
     grid[(y-3+rows) % rows][(x+18 + cols) % cols] = 1;
     grid[(y-3+rows) % rows][(x+17 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x+5 + cols) % cols] = 1;
     grid[(y+rows) % rows][(x+7 + cols) % cols] = 1;
     grid[(y+1+rows) % rows][(x+7 + cols) % cols] = 1;
     grid[(y-1+rows) % rows][(x+3 + cols) % cols] = 1;
     grid[(y-1+rows) % rows][(x+4 + cols) % cols] = 1;
     grid[(y-2+rows) % rows][(x+3 + cols) % cols] = 1;
     grid[(y-2+rows) % rows][(x+4 + cols) % cols] = 1;
     grid[(y-3+rows) % rows][(x+3 + cols) % cols] = 1;
     grid[(y-3+rows) % rows][(x+4 + cols) % cols] = 1;
     grid[(y-4+rows) % rows][(x+5 + cols) % cols] = 1;
     grid[(y-4+rows) % rows][(x+7 + cols) % cols] = 1;
     grid[(y-5+rows) % rows][(x+7 + cols) % cols] = 1;
   } else if (grid[y][x] == 0) {
     grid[y][x] = 1;
   } else {
     grid[y][x] = 0;
   }
  }
}

int count_neighbors(int [][]grid, int x, int y)
{
  int sum = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      int row = (y + i + rows) % rows;
      int col = (x + j + cols) % cols;
      sum += grid[row][col];
    }
  }
  sum -= grid[y][x];
  return (sum);
}
