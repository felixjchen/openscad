$fn = 100;

// Measurements (mm)
pump_d = 24;        // Flextail pump outlet
inflate_d = 30;     // Big Agnes inflate valve
deflate_d = 18;     // Big Agnes deflate valve
pump_wall = 2;
wall = 2;
tol = 0;

module inflate_adapter(h = 20) {
    pump_id = pump_d + tol;
    pad_od = inflate_d - tol;
    pump_grip = h * 0.375;
    pad_insert = h * 0.375;
    taper = h * 0.25;

    difference() {
        union() {
            cylinder(d = pump_d, h = pump_grip);
            translate([0, 0, pump_grip])
                cylinder(d1 = pump_d, d2 = pad_od, h = taper);
            translate([0, 0, pump_grip + taper])
                cylinder(d1 = pad_od, d2 = pad_od - 1, h = pad_insert);
        }
        translate([0, 0, -0.1])
            cylinder(d1 = pump_d - pump_wall * 2, d2 = pad_od - wall * 2, h = pump_grip + taper + pad_insert + 0.2);
    }
}

module deflate_adapter(h = 17) {
    deflate_pump_od = 24;
    deflate_pump_id = 24 - 1.45 * 2;
    valve_od = 20;
    pump_grip = h * 0.4;
    valve_insert = h * 0.35;
    taper = h * 0.25;

    difference() {
        union() {
            cylinder(d = deflate_pump_od, h = pump_grip);
            translate([0, 0, pump_grip])
                cylinder(d1 = deflate_pump_od, d2 = valve_od, h = taper);
            translate([0, 0, pump_grip + taper])
                cylinder(d1 = valve_od, d2 = valve_od - 0.5, h = valve_insert);
        }
        translate([0, 0, -0.1])
            cylinder(d1 = deflate_pump_id, d2 = valve_od - wall * 2, h = pump_grip + taper + valve_insert + 0.2);
    }
}

// Show both side by side
inflate_adapter();
translate([45, 0, 0]) deflate_adapter();
