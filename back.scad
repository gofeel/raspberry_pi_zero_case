width = 75;
mgn = 8.5;
hole = 2.8;
top_hole = 5.8;
height = 3.5;
tp = 1;
$fn=24;

b = 20;
h = 20;
w = 4;

l = 10;
c = 5;
kkk = height + c;
q = 60;
ppp = 3;
union(){
    difference() { 
        union(){
            translate([0, 0, 0]){
                linear_extrude(height)
                    square([width, width]);
            }
            difference() {
                translate([0,-ppp,0])
                rotate(a=[-90,-90,0]) {
                linear_extrude(height = width+ ppp * 2, convexity = 10, twist = 0)
                    polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);
                }
            rotate(a=[0,90,0]) mirror(v=[1,0,0]) p();
            rotate(a=[-90,-90,-90])kk();
            }
        }
        //hole
        for(x = [mgn, width-mgn]){
            for(y = [mgn, width-mgn]) {
                top_hole(x,y);
            }
        }
    }
}


module top_hole(x,y) {
    translate([x, y,0])
        cylinder( d = hole, h = height+h);
    translate([x, y, tp])
        cylinder( d = top_hole, h = height+h,$fn = 6);
}

module p() {
    translate([kkk, l ,0])
        cylinder(r = c, h = q);
    translate([kkk - c, l , 0])
        linear_extrude(q)
            square([c, width - l * 2]);
    translate([kkk, l - c, 0])
        linear_extrude(q)
            square([20, width - l * 2 + c * 2]);
    translate([kkk, width - l ,0])
        cylinder(r = c, h = q);
}

module kk() {
    linear_extrude(height = width, convexity = 10, twist = 0){
        polygon(points=[[0,0], [0,ppp], [h,ppp]], paths=[[0,1,2]]);
    }

    linear_extrude(height = width, convexity = 10, twist = 0){
        polygon(points=[[0,-width], [0, -width - ppp], [h,-width-ppp]], paths=[[0,1,2]]);
    }
}