$fn=24;
ps = 0.01;

mw = 65;
mh = 30;
mhw = 58;
mhh = 23;

device_mgn = 0.3;

width = 75;
mgn = (width - mhw) / 2.0;

hole = 2.5 + 0.3;
top_hole = 4.5;
hex_size = 6;
hex_nut_height = 2.5;

plate_height = 2;
wall_height = 6.5;
total_height = plate_height + wall_height;

top_margin = mgn - (mw - mhw) / 2;
wall_width = 2.5;

parts_space_depth = 0;
parts_space_top_height = 28;
parts_space_bottom_x = 9;

pp = width - mh - top_margin - wall_width;

stopper_width = 3;
stopper_height = 4;
stopper_depth = 1;
bottom_stopper_width = 10;
bottom_stopper_height = 5;
bottom_stopper_x = 40;

usb_hole_x = 14.0;
usb_hole_width = 4.5;
usb_hole_depth = 6;

union() {
    difference() {
        //box
        translate([0, 0, 0]){
            linear_extrude(total_height)
            square([width, width]);
        }
        translate([wall_width, top_margin - device_mgn, plate_height]){
            linear_extrude(total_height - plate_height + ps)
            square([width - wall_width * 2, mh + parts_space_top_height + device_mgn]);
        }
        //box
        //parts_space
        translate([(width - mw)/2 - device_mgn, top_margin + mh, parts_space_depth]){
            linear_extrude(total_height - plate_height + ps)
            square([mw + device_mgn * 2, parts_space_top_height]);
        }

        //parts_space_bottom
        translate([(width - mw)/2 + parts_space_bottom_x, top_margin + mh, parts_space_depth]){
            linear_extrude(total_height)
            square([mw - parts_space_bottom_x * 2, pp]);
        }

        //hole
        for(x = [mgn, width-mgn]){
            for(y = [mgn, width-mgn, mgn + mhh]) {
                hex_hole(x,y);
            }
        }
        //usb out
        translate([usb_hole_x, width - wall_width - ps, total_height - usb_hole_depth]){
            linear_extrude(usb_hole_depth + ps)
            square([usb_hole_width, wall_width + ps * 2]);
        }
    }

    translate([bottom_stopper_x, top_margin + mh, ps]){
        linear_extrude(plate_height + stopper_depth)
        square([bottom_stopper_width, bottom_stopper_height]);
    }
    for(x = [(width - mw)/ 2 - stopper_width - device_mgn, width - (width - mw)/ 2 + device_mgn]) {
        for(y = [top_margin,  top_margin + mh - stopper_height]) {
            translate([x, y, ps]){
                linear_extrude(plate_height + stopper_depth)
                square([stopper_width, stopper_height]);
            }
        }
    }
}

module hex_hole(x,y) {
    translate([x, y,-ps])
        cylinder( d = hole, h = total_height + ps * 2);
}
