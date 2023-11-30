
// Cylindar count
cylinder_rows = 3;
cylinder_cols = 6;

// Cylinder dimensions
cylinder_diameter = 13; // 1.3cm diameter
cylinder_height = 20; // 2cm height

cylinder_space = 10; // 0.1cm between cylinders

// Countainer walls
container_wall_width = 0; // 0.cm walls
container_floor_height = 5; // 0.3cm floor

// CONSTANTS
$fn = 100;

difference() {
    length = container_wall_width + cylinder_space + cylinder_rows *(cylinder_diameter + cylinder_space) + container_wall_width;
    
    width = container_wall_width + cylinder_space + cylinder_cols*(cylinder_diameter + cylinder_space) + container_wall_width;
    
    height = container_floor_height + cylinder_height;
    
    echo("Length: ", length, " Width: ", width, " Height: ", height);

    // cube([length, width, height]); // Outer cube
    linear_extrude(height)  minkowski() {
      square([length,width]); 
      circle(4);
    }

    // Creating the grid of cylinders
    translate([container_wall_width + cylinder_space + cylinder_diameter/2, container_wall_width + cylinder_space + cylinder_diameter/2, container_floor_height]) {
        for (i = [0:cylinder_rows-1]) {
            for (j = [0:cylinder_cols-1]) {
                translate([
                    (i) * (cylinder_diameter + cylinder_space),
                    (j) * (cylinder_diameter + cylinder_space),
                    1
                ]) {
                    translate([0, 0, container_floor_height]) {
                      cylinder(h = cylinder_height, d = cylinder_diameter, center = false);
                      sphere(d = cylinder_diameter);
                    }
                }
            }
        }
    }
}
