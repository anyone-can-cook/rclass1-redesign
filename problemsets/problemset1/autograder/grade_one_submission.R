#install gradeR
#install.packages("gradeR")
# load in the package
library(gradeR)

#gradescope
calcGradesForGradescope("problemset1.R",       # each student's submission must be named this!
                        "problemset1_tests.R") # the file with all of the testthat tests 
  

#file directory to submission folder
#submissionDir <- "./"

# get the grades
#grades <- calcGrades(submission_dir = submissionDir, 
#                     your_test_file = "./autograder/problemset1_tests.R")
