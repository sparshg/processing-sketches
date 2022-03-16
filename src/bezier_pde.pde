float[][] points = { {20, 200}, {100, 100}, {200, 150}, {300, 100} };
int dragMode = -1;

void setup() {
  size(500, 500);
}

void draw() {
  background(50);
  for (int i = 0; i < points.length; i++) {
    circle(points[i][0], points[i][1], 5);
    if ((dist(points[i][0], points[i][1], mouseX, mouseY) < 10) || dragMode == i) {
      if (mousePressed) {
        dragMode = i;
        points[i][0] = mouseX;
        points[i][1] = mouseY;
      } else {
        dragMode = -1;
      }
    }
  }
  beginShape(LINES);
  strokeWeight(3);
  stroke(255);
  for (float i = 0; i < 1; i += 0.01) {
    float[] point = cinterp(points[0], points[1], points[2], points[3], i);
    vertex(point[0], point[1]);
  }
  endShape();
}

float[] linterp(float[] a, float[] b, float t) {
  float[] c = { a[0] + (b[0] - a[0]) * t,
    a[1] + (b[1] - a[1]) * t };
  return c;
}

float[] qinterp(float[] a, float[] b, float[] c, float t) {
  float[] c1 = linterp(a, b, t);
  float[] c2 = linterp(b, c, t);
  return linterp(c1, c2, t);
}

float[] cinterp(float[] a, float[] b, float[] c, float[] d, float t) {
  float[] c1 = qinterp(a, b, c, t);
  float[] c2 = qinterp(b, c, d, t);
  return linterp(c1, c2, t);
}
