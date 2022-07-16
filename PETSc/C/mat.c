//  Basic matrix manipulations with PETSc.
//  Julien VALENTIN (July, 2022)  julien.vlnt@gmail.com
//  Largely inspired from
//  https://wg-beginners.readthedocs.io/en/latest/tutorials/mat/introductory_tutorial_mat.html
#include <petscmat.h>

int main(int argc, char ** argv)
{
    PetscErrorCode ierr;
    PetscInt i         // used in the following for loops
            ,n=10      // dimension of R^n
            ,rstart    // indice of the first row of the k-th job
            ,rend      // indice of the last row of the k-th job
            ;
    PetscReal one[1] = {1.0};    // PETSc data structure for real scalars
    Mat Id;              // PETSc data structure for matrix

    // Initialize PETSc components.
    ierr = PetscInitialize(&argc, &argv, PETSC_NULL, PETSC_NULL);
    CHKERRQ(ierr);
    if(ierr){ return ierr; }

    /*
        Create the identity matrix of R^n.
    */
    ierr = MatCreate(PETSC_COMM_WORLD, &Id);
    CHKERRQ(ierr);

    ierr = MatSetSizes(Id, PETSC_DECIDE, PETSC_DECIDE, n, n);
    CHKERRQ(ierr);

    ierr = MatSetFromOptions(Id);
    CHKERRQ(ierr);

    ierr = MatSetUp(Id);
    CHKERRQ(ierr);

    // Insert the values on the principal diagonal
    ierr = MatGetOwnershipRange(Id, &rstart, &rend);
    CHKERRQ(ierr);

    // Iter on the 1D indice
    for (i=rstart; i<rend; i++)
    {
        ierr = MatSetValues(Id, 1, &i, 1, &i, one, INSERT_VALUES);
        CHKERRQ(ierr);
        if(ierr) { return ierr; }
    }

    //
    ierr = MatAssemblyBegin(Id, MAT_FINAL_ASSEMBLY);
    CHKERRQ(ierr);
    
    ierr = MatAssemblyEnd(Id, MAT_FINAL_ASSEMBLY);
    CHKERRQ(ierr);

    /*
        Have a look to the Identity matrix
    */
    ierr = PetscPrintf(MPI_COMM_WORLD, "Here is the identity operator of R^n\n");
    CHKERRQ(ierr);
    ierr = PetscPrintf(MPI_COMM_WORLD, "------------------------------------\n");
    CHKERRQ(ierr);
    ierr = MatView(Id, PETSC_VIEWER_STDOUT_WORLD);
    CHKERRQ(ierr);
    ierr = PetscPrintf(MPI_COMM_WORLD, "====================================\n");
    CHKERRQ(ierr);

    // Free memory
    ierr = MatDestroy(&Id);
    CHKERRQ(ierr);

    // Finalize the program.
    PetscFinalize();
    
    // Return 
    return 0;
}