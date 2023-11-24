$fn = 100; // High value for smoothness

// Knobs
text_size = 3;
text_height = 1;

module doughnut(inner_radius = 10, tube_radius = 5) {
  // Doughnut profile (a circle) to be extruded
  module doughnut_profile() {
      translate([inner_radius + tube_radius, 0, 0])
          circle(r = tube_radius);
  }

  // Creating the doughnut by rotating the profile
  rotate_extrude()
      doughnut_profile();
}

// Hacker symbols module
module hacker_symbols_cube(x_size, y_size, z_size) {
    symbols = ["{", "}", "[", "]", "#", "&", "//", "@", "?", "0", "1",  "<", ">", "|"];
    for (x = [0 : x_size - 1]) {
        for (y = [0 : y_size - 1]) {
            for (z = [0 : z_size - 1]) {
            idx = floor(rands(0,len(symbols)-1,1)[0]); // Simple pattern instead of random
            symbol = symbols[idx];
            translate([x*text_size, y*text_size, z*text_height])
                linear_extrude(height = text_height)
                    text(symbol, size = text_size, valign = "center", halign = "center");
          }
        }
    }
}


// Main module
module main() {
    intersection() {
      doughnut(inner_radius = 4, tube_radius = 4);
      translate([-14, -14, -5]) hacker_symbols_cube(x_size = 10, y_size = 10, z_size = 10);
    }
}

main();