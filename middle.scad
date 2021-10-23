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

plate_height = 3.5;
wall_height = 8;
total_height = plate_height + wall_height;

top_margin = mgn - (mw - mhw) / 2;
wall_width = 2.5;

parts_space_depth = 1.5;
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
usb_hole_depth = 7;
height = 5.5;

ch = top_hole + 2;
h = 1;
difference() {
    union() {
        //box
        xxx(-mhw/2,mhh/2);
        xxx(mhw/2,mhh/2);
        xxx(mhw/2,-mhh/2);
        xxx(-mhw/2,-mhh/2);

        zzz();
        mirror(v=[1,0,0]) zzz();
        mirror(v=[1,0,0]) mirror(v=[0,1,0]) zzz();
        mirror(v=[0,1,0]) zzz();
        translate([-mhw/2 + mhh/4 + ch/2, -ch/2, 0]){
            linear_extrude(h)
            square([mhw-18,ch]);
        }
    }
    yyy(-mhw/2,mhh/2);
    yyy(mhw/2,mhh/2);
    yyy(mhw/2,-mhh/2);
    yyy(-mhw/2,-mhh/2);
}

module xxx(x,y) {
    difference() {
        translate([x, y, 0]){
            linear_extrude(height)
            circle(d = ch);
        }
    }
}

module yyy(x,y) {
    difference() {
        translate([x, y, -ps]){
            linear_extrude(height + ps * 2)
            circle(d=hole);
        }
    }
}

module zzz(){
    translate([mhw/2-mhh/4, mhh/4, 0]) 
    rotate(a=[0,0,45]){
        linear_extrude(h)
        square([mhh-6,ch], center=true);
    }
}