
#question 1
getwd()
list.files()

#The output are files: "problemset1.R", "problemset1.qmd", and "problemset1.Rproj" because these are the files currently saved in the folder where this .R file is saved.

#question 2

list.files()
#The output now are files: "problemset1.R", "problemset1.qmd", "problemset.pdf" and "problemset1.Rproj" because I rendered the .qmd file to pdf output.

#question 3
df_recruiting <- read_csv("recruit_ps1.csv")
df_recruiting

typeof(df_recruiting)

length(df_recruiting)
#Answer:the data frame object `df_recruiting` has a length of 6, meaning that there are 6 elements in the object.

str(df_recruiting)

names(df_recruiting)

typeof(names(df_recruiting))
length(names(df_recruiting))
str(names(df_recruiting))

#Answer:the names of the elements of the data frame object `df_recruiting` are a character atomic vector of 6 elements

#question 4
age <- c(3,6,41,43)

typeof(age)

length(age)
str(age)

sum(age)

#Answer: When calling a function, the argument name tells R which argument you are referring to (e.g., the `trim` argument) and the argument value is the value you are assigning to that argument. the argument `na.rm` controls whether `NA` values are removed or not prior to performing calculations.

age2 <- c(3,6,41,43,NA)
sum(age2, na.rm = FALSE)
sum(age2, na.rm = TRUE)

#Answer: The function `sum(age2, na.rm = FALSE)` returns `NA` because `NA` values are not removed prior to calculation and any calculation that includes an `NA` value returns `NA`. The function `sum(age2, na.rm = TRUE)` does not return `NA` because all `NA` values are removed prior to calculation.

tf <- c(TRUE,FALSE,TRUE,FALSE,TRUE,NA)

typeof(tf)
length(tf)
str(tf)

#Answer: the object `tf` is an atomic vector of logical type with 5 elements.

sum(tf, na.rm = TRUE)
#Answer: Mathematical calculations in `R` assign the value of `0` to `FALSE` and the value of `1` to `TRUE`

mean(x=tf, trim = 0, na.rm = TRUE)
mean(tf, 0, TRUE)
