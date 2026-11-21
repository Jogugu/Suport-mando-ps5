// Soporte para mando PS5 (DualSense) - paramétrico
// El mando se apoya de pie sobre las dos empuñaduras, inclinado hacia atrás.
// Se imprime tal cual, apoyado en la cama, sin soportes.
// Todas las medidas en mm. MIDE tu mando con un calibre y ajusta los valores.

/* [Mando] */
grip_spacing = 112;  // distancia entre centros de las dos empuñaduras
grip_w       = 40;   // ancho del extremo de la empuñadura (eje X)
grip_d       = 46;   // fondo del extremo de la empuñadura (eje Y)

/* [Soporte] */
clearance    = 1.0;  // holgura alrededor de la empuñadura
wall         = 3.5;  // grosor de pared
base_t       = 4;    // grosor de la base bajo las cavidades
pocket_depth = 28;   // profundidad de cada cavidad
tilt         = 12;   // inclinación hacia atrás (grados)
bridge_d     = 30;   // fondo de la pieza que une las dos cavidades

$fn = 72;

in_w = grip_w + 2*clearance;
in_d = grip_d + 2*clearance;
out_w = in_w + 2*wall;
out_d = in_d + 2*wall;
H  = base_t + pocket_depth;
z0 = base_t + (in_d/2)*sin(tilt);   // el punto más bajo del hueco queda a base_t

module oval(w, d, h) {
    linear_extrude(height = h) scale([w/2, d/2]) circle(r = 1);
}

module tilted(w, d, len, start = 0) {
    translate([0, 0, z0]) rotate([-tilt, 0, 0]) translate([0, 0, start]) oval(w, d, len);
}

module cup_body() {
    intersection() {
        tilted(out_w, out_d, pocket_depth*2 + 50, -25);
        translate([-100, -100, 0]) cube([200, 200, H]);
    }
}

module cup_hole() {
    tilted(in_w, in_d, pocket_depth*2 + 50);   // el suelo del hueco arranca en z0
}

difference() {
    union() {
        for (s = [-1, 1]) translate([s*grip_spacing/2, 0, 0]) cup_body();
        // pieza que une las dos cavidades
        translate([-grip_spacing/2, -bridge_d/2, 0]) cube([grip_spacing, bridge_d, base_t]);
    }
    for (s = [-1, 1]) translate([s*grip_spacing/2, 0, 0]) cup_hole();
}
