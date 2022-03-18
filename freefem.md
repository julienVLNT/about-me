Aide-mémoire de Julien VALENTIN, mars 2022.


- [Compilation et exécution](#compilation-et-exécution)
  - [Linux](#linux)
  - [Windows Subsystem for Linux v.2 avec GUI](#windows-subsystem-for-linux-v2-avec-gui)
- [Objets](#objets)
  - [Les maillages](#les-maillages)
- [Références](#références)

# Installation <!-- omit in TOC -->

## *Linux* <!-- omit in TOC -->

```bash
julien@julien-desktop:~$ sudo apt update
julien@julien-desktop:~$ sudo apt install freefem++
```

## *Windows* <!-- omit in TOC -->

## *Mac* <!-- omit in TOC -->

# Compilation et exécution

## Linux

Dans le répertoire où se trouve le script :

- `FreeFem++ script.edp`

Sinon, par son chemin absolu

- `FreeFem++ /chemin/vers/le/script.edp`

## Windows Subsystem for Linux v.2 avec GUI

(c.f [wsl.md](wsl.md))

- `wsl.exe FreeFem++ script.edp`

# Objets

## Les maillages

- 1.D : `meshL`
- 2.D : `mesh`
- 3.D : `mesh3`
- 3.D (surface) : `meshS`
- 3.D (ligne)   : `meshL`

```cpp
// ----------------------------------------------------- MAILLAGES 1.D

// ----------------------------------------------------- MAILLAGES 2.D
mesh Th = square(n, m);                               // grille n x m du carré [0,1] x [0,1]

mesh Th = square(n, m, [x0+(x1-x0)*x, y0+(y1-y0)*y]); // grille n x m du carré [x0, x1] x [y0, y1]

int n = 10;                                           // grille du cercle unité
border C(t=0, 2*pi) {x=cos(t); y=sin(t);};            // cercle C (bord du domaine)
mesh Th = buildmesh(C(n));                            // n est le nombre de points sur le cercle

int n = 10;                                           // grille du cercle de rayon r centré en 0
real r = 2.;                                          // r est le rayon du cerle
border C(t=0, 2*pi) {x=r*cos(t); y=r*sin(t);};        // cerce C (bord du domaine)
mesh Th = buildmesh(C(n));                            // n est le nombre de points sur le cercle

int n   =  10;                                        // grille du cercle unité translaté, centré en P[x0, y0]
real x0 =  1.;                                        // absisse du centre du cercle
real y0 = -1.;                                        // ordonnée du centre du cercle
border C(t=0, 2*pi) {x=x0+cos(t); y=y0+sin(t);};      // cerce C (bord du domaine)
mesh Th = buildmesh(C(n));                            // n est le nombre de points sur le cercle

// ----------------------------------------------------- MAILLAGES 3.D

// ----------------------------------------------------- IMPORT / EXPORT
savemesh(Th, "name.mesh");                            // enregistre le maillage 2.D dans le fichier 

savesurfacemesh(Th, "name.mesh");                     // enregistre le maillage 3.D dans le fichier
```

# Références

- [language references](https://doc.freefem.org/references/index.html)
- [examples](https://doc.freefem.org/examples/index.html)
- [mathematical models](https://doc.freefem.org/models/index.html)