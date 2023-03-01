# freewater-fernet

Note, this is not an original work, but rather a repackaging of the following repository:
[Fernet Freewater Estimation](https://github.com/DiCIPHR-Lab/Fernet)

Reason for the repackaging instead of branching is that there were gigabytes of commits on the
original repository that we didn't want to bring along, this one includes only the files necessary
to get the program running.

We added a few edits to the source files to handle some Python version related errors and to allow the
iterative freewater estimation to terminate when the second derivative of prediction error hits 0 
(making number of iterations parameter in the script more like number of maximal iterations).

We also added an additional output of pickle file with gradient descent information recorded,
and number of iterations to minimize prediction error (number of iterations at termination).
We suggest the number of iterations to termination be used as a covariate for any statistical analysis
using these freewater estimates, to make sure it isn't driving the result.

## Installation & Usage

```sh
# installing the python package
pip install git+https://github.com/neuro-stivenr/fernet-freewater

# running the fernet command once installed
fernet -h

# minimal commandline arguments
# assumes that sub-TEST_dwi.bval and sub-TEST_dwi.bvec exist
fernet \
  -d sub-TEST_dwi.nii.gz \ # diffusion weighted image with B0 as the first volume
  -m sub-TEST_brainmask.nii.gz \ # binary image delineating the boundaries of the brain
  -o sub-TEST \ # prefix to use for the output images
  -n 300 # max number of iterations to run (terminates automatically on condition described above)
```

For further detail please refer back to the original package linked to above.
