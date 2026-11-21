# Soporte para mando PS5 (DualSense)

Soporte paramétrico en OpenSCAD: el mando se apoya de pie sobre las dos empuñaduras, inclinado hacia atrás.

## Uso
1. Abre `soporte_mando_ps5.scad` en OpenSCAD.
2. Mide con un calibre el extremo de las empuñaduras y ajusta `grip_w`, `grip_d` y `grip_spacing`.
3. Render (F6) y exporta STL.

## Impresión
- Sin soportes, apoyado en la cama.
- PLA o PETG, capa 0,2 mm, 3-4 perímetros, 15-20 % de relleno.
- Opcional: fieltro o pies de goma en la base.

## Subir a GitHub
```bash
git init
git add .
git commit -m "Soporte mando PS5 paramétrico"
git branch -M main
git remote add origin git@github.com:TU_USUARIO/soporte-mando-ps5.git
git push -u origin main
```
