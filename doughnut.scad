// CONSTANTS
$fn = 25;

module ring(r1,r2,h) {
  linear_extrude(height = h) {
    difference() {
      circle(r2);
      circle(r1);
    }
  }
}

module doughnut(radius, hole_radius, dough_radius,height) {
minkowski() {
  ring(r2=radius,r1=hole_radius,h=height);
  sphere(r=dough_radius);
}
}


doughnut(radius=10, hole_radius=5, dough_radius=3, height=10);