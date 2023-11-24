
// Cylindar count
cylinder_rows = 1;
cylinder_cols = 1;

// Cylinder dimensions
cylinder_diameter = 13; // 1.3cm diameter
cylinder_height = 20; // 2cm height

cylinder_space = 5; // 0.5cm between cylinders

// Countainer walls
container_wall_width = 0.2; // 0.02cm walls
container_floor_height = 4; // 4cm floor

// CONSTANTS
$fn = 250;


difference() {
    length = container_wall_width + cylinder_space + cylinder_rows*(cylinder_diameter + cylinder_space) + container_wall_width;
    
    width = container_wall_width + cylinder_space + cylinder_cols*(cylinder_diameter + cylinder_space) + container_wall_width;
    
    height = container_floor_height + cylinder_height;
    
    echo("Length: ", length, " Width: ", width, " Height: ", height);
    cube([length, width, height]); // Outer cube
    
    
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
