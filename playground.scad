// CONSTANTS
$fn = 250;

translate([1, 1, 1]) {
  minkowski() {
    cube(1);
    sphere(1);
  }
}