$fn = 25;

module main_body() {
  cube([10, 34, 22]);
  // Define vertices for the triangular prism
  vertices = [
      [10, 0, 0],    // A
      [10, 0, 22], 
      [10,42,0], // B
      [10,42,22],
      [18,42,0], // C
      [18,42,22]
  ];

  // Define faces using vertex indices
  faces = [
      [0, 4, 2], // top triangle
      [1, 3, 5], // bottom triangle
      [0, 2, 3, 1], // back panel
      [2, 4, 5, 3], // top panel
      [0, 1, 5, 4]  // right panel
  ];


  // Create the polyhedron
  polyhedron(points = vertices, faces = faces);
}

module lip() {
  translate([-3,0,6]) cube([3,3,10]);
  translate([-3,-1.5,7]) cube([1,1.5,8]);
}

module empty_space_same () {
  translate([2,2,2]) cube([16, 30, 18]);
  translate([0,25,9 + 2.5])  rotate([0,90,0]) cylinder(h = 40, d=5, centre = true);
}

module empty_space_printable () {
  translate([0,25,9 + 2.5])  rotate([0,90,0]) cylinder(h = 40, d=5, centre = true);
  translate([4,25,9 + 2.5])  rotate([0,90,0]) cylinder(h = 40, d=8.2, centre = true);
}

module main() {
  difference() {
    main_body();
    empty_space_printable();
  }
  
  lip();
}

#main();