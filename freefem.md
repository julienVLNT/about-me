Aide-mémoire de Julien VALENTIN, mars 2022.

# Installation <!-- omit in TOC -->

## *Linux* <!-- omit in TOC -->

```bash
julien@julien-desktop:~$ sudo apt update
julien@julien-desktop:~$ sudo apt install freefem++
```

# Compilation et exécution <!-- omit in TOC -->

## Linux <!-- omit in TOC -->

Dans le répertoire où se trouve le script :

- `FreeFem++ script.edp`

Sinon, par son chemin absolu

- `FreeFem++ /chemin/vers/le/script.edp`

## Windows Subsystem for Linux v.2 avec GUI <!-- omit in TOC -->

(c.f [wsl.md](wsl.md))

- `wsl.exe FreeFem++ script.edp`

# Table des matières <!-- omit in TOC -->

- [Scripts](#scripts)
  - [Les maillages](#les-maillages)
- [Références](#références)

# Scripts

## Les maillages

```cpp
// --------------------------------------------------------- MAILLAGES 2.D
mesh Th = square(n, m);                                   // grille n x m du carré [0,1] x [0,1]

mesh Th = square(n, m, [x0+(x1-x0)*x, y0+(y1-y0)*y]);     // grille n x m du carré [x0, x1] x [y0, y1]

int n = 10;                                               // grille du triangle rectangle isocèle A(0,0), B(1,0), C(1,1)
border a(t=0, 1){x=t  ; y=0  ;};                          // segment [A, B]
border b(t=0, 1){x=1-t; y=t  ;};                          // segment [B, C]
border c(t=0, 1){x=0  ; y=1-t;};                          // segment [C, A]
mesh Th = buildmesh(a(n) + b(n) + c(n));                  // n points par segment

int n = 10;                                               // grille du cercle unité
border C(t=0., 2.*pi) {x=cos(t); y=sin(t);};              // cercle C (bord du domaine)
mesh Th = buildmesh(C(n));                                // n est le nombre de points sur le cercle

int n = 10;                                               // grille du cercle de rayon r centré en 0
real r = 2.;                                              // r est le rayon du cerle
border C(t=0., 2.*pi){x=r*cos(t); y=r*sin(t);};           // cerce C (bord du domaine)
mesh Th = buildmesh(C(n));                                // n est le nombre de points sur le cercle

int n   =  10;                                            // grille du cercle unité translaté, centré en P[x0, y0]
real x0 =  1.;                                            // absisse du centre du cercle
real y0 = -1.;                                            // ordonnée du centre du cercle
border C(t=0., 2.*pi){x=x0+cos(t); y=y0+sin(t);};         // cerce C (bord du domaine)
mesh Th = buildmesh(C(n));                                // n est le nombre de points sur le cercle

int  n  = 10;                                             // grille de l'ellipse translatée en P[x0, y0]
real x0 = 1.;                                             // absisse du centre
real y0 = 1.;                                             // ordonnée du centre
real a  = 2.;                                             // demi grand axe
real b  = 1.;                                             // demi petit axe
border E(t=0., 2.*pi){x=x0+a*cos(t); y=y0+b*sin(t);};     // paramétrage du contour
mesh Th = buildmesh(E(n));                                // n est le nombre de points sur l'ellipse

int  n = 25;                                              // grile du disque centré en O(0,0) de rayon 5. privé du rectangle A(1,3),B(2,3),C(2,-3),D(1,-3)
int L0 =  0;                                              // label du cercle
int L1 =  1;                                              // label du rectangle
border C0(t=0., 2.*pi){x=5*cos(t); y=5*sin(t); label=L0;} // construction du cercle
border C11(t=0.,1.){x=1.+t; y=3.      ; label=L1;}        // construction du segment AB : x \in [1, 2]; y = 3
border C12(t=0.,1.){x=2.  ; y=3.-6.*t ; label=L1;}        // construction du segment BC : x = 2       ; y \in [3, -3]
border C13(t=0.,1.){x=2.-t; y=-3.     ; label=L1;}        // construction du segment CD : x \in [2, 1]; y = -3
border C14(t=0.,1.){x=1.  ; y=-3.+6.*t; label=L1;}        // construction du segment DA : x = 1.      ; y \in [-3, 3]
mesh Th = buildmesh(C0(n) + C11(n)+C12(n)+C13(n)+C14(n)); // construction du maillage (ne maille pas le rectangle)

int  n = 25;                                              // grille du disque centré en O(0,0) de rayon 5 privé du rectangle A(1,3),B(2,3),C(2,-3),D(1,-3)
int L0 =  0;                                              // mais avec second maillage du rectangle E(-2,3),F(-1,3),G(-1,-3),H(-2,-3)
int L1 =  1;                                              // 
int L2 =  2;                                              //
border C0(t=0., 2.*pi){x=5*cos(t); y=5*sin(t); label=L0;} // cercle C de centre (0,0) et de rayon 5
border C11(t=0.,1.){x=1.+t; y=3.      ; label=L1;}        // segment [A,B]
border C12(t=0.,1.){x=2.  ; y=3.-6.*t ; label=L1;}        // segment [B,C]
border C13(t=0.,1.){x=2.-t; y=-3.     ; label=L1;}        // segment [C,D]
border C14(t=0.,1.){x=1.  ; y=-3.+6.*t; label=L1;}        // segment [D,A]
border C21(t=0.,1.){x=-2.+t; y=3.      ; label=L2;}       // segment [E,F]
border C22(t=0.,1.){x=-1.  ; y=3.-6.*t ; label=L2;}       // segment [F,G]
border C23(t=0.,1.){x=-1.-t; y=-3.     ; label=L2;}       // segment [G,H]
border C24(t=0.,1.){x=-2.  ; y=-3.+6.*t; label=L2;}       // segment [H,E]
mesh Th = buildmesh(                                      //
          C0(n)                                           // maille le cercle
        + C11(n)  + C12(n)  + C13(n)  + C14(n)            // efface le maillage du rectangle ABCD
        + C21(-n) + C22(-n) + C23(-n) + C24(-n)           // maille indépendament le rectangle EFGH
        );                                                //

// --------------------------------------------------------- IMPORT / EXPORT
savemesh(Th, "name.mesh");                                // enregistre le maillage 2.D dans le fichier 
savesurfacemesh(Th, "name.mesh");                         // enregistre le maillage 3.D dans le fichier
```

# Références

- [language references](https://doc.freefem.org/references/index.html)
- [examples](https://doc.freefem.org/examples/index.html)
- [mathematical models](https://doc.freefem.org/models/index.html)