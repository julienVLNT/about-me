//  About vectors in C.
//  Julien VALENTIN (July 2022)  julien.vlnt@gmail.com
//  Largely inspired from :
//  https://wg-beginners.readthedocs.io/en/latest/tutorials/vec/introductory_tutorial_vec.html
#include <petscvec.h>
#include <petscsys.h>

int main(int argc, char ** argv)
{
    PetscErrorCode ierr;       // will receive a check after every PETSc instruction
    Vec x;                     // A PETSc data structure that represents vectors
    PetscInt i, start, end;    // PETSc data structure for integers
    PetscInt n = 20;           // size of the vector
    PetscReal dot, norm, a;    // PETSc data structure for real numbers

    // Initialize PETSc tools
    ierr = PetscInitilize(&argc, &argv, PETSC_NULL, PETSC_NULL);
    // Check the execution termination code
    CHKERRQ(ierr);
    // If an error is detected, return its code
    if(ierr) { return ierr; }

    // Create a vector
    ierr = VecCreate(PETSC_COMM_WORLD, &x);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Set the size of the vector
    ierr = VecSetSizes(x, PETSC_DECIDE, n);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Set options for the vector
    ierr = VecSetFromOptions(x);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Distribute the range of the vector between the different jobs
    ierr = VecGetOwnershipRange(x, &start, &end);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Fill-in the vector with integers from one to 20
    for (i=start; i<end; i++)
    {
        a = (PetscScalar)(i);
        VecSetValues(x, 1, &i, &a, ADD_VALUES);
    }

    // Assemble the vector
    ierr = VecAssemblyBegin(x);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // In two parts...
    ierr = VecAssemblyEnd(x);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Let print the components of that vec.
    ierr = VecView(x,PETSC_VIEWER_STDOUT_WORLD);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Compute and then print the norm of that vector
    ierr = VecTDot(x, x, dot);    // compute x^T x
    CHKERRQ(ierr);
    if(ierr) { return ierr; }
    // Print the computed scalar
    ierr = PetscPrintf(PETSC_COMM_WORLD, "x^T x = %g\n", dot);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Compute the euclidean norm of the vector
    ierr = VecNorm(x, NORM_2, &norm);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }
    // Print this second scalar
    ierr = PetscPrintf(PETSC_COMM_WORLD, "|| x || = %g\n", norm);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Free memory
    ierr = VecDestroy(&x);
    CHKERRQ(ierr);
    if(ierr) { return ierr; }

    // Finalize !
    ierr = PetscFinalize();
    CHKERRQ(ierr);
    if(ierr) { return ierr; }
    
    // End of the program
    return 0;
}