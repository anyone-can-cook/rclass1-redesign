library(testthat)
library(stringr)

#delete this line

# each call to test_that() produces one test
# each test represents one point value
# you can have multiple tests for each question


#test_that("first (visible)", {
  
#  expect_true(str_detect(getwd(), "\\/problemset1")) 
#  expect_true(length(list.files()) > 4)

#})


test_that("second", {

  expect_equal(nrow(df_recruiting), 6)
  expect_equal(typeof(df_recruiting), "list")
  expect_equal(length(df_recruiting), 6)
  expect_output(str(df_recruiting), "$ school_type", fixed = TRUE)
  expect_equal(names(df_recruiting), c("state_code","school_type","ncessch","name","address","city"))
  

})

test_that("third", {
  
  expect_equal(sum(age), 93)
  expect_equal(typeof(age), "double")
  expect_equal(length(age), 4)
  expect_output(str(age), "num [1:4]", fixed = TRUE)
  expect_equal(sum(age), 93)
  expect_output(sum(age2), NA)
  expect_equal(sum(age2, na.rm = TRUE), 93)
  expect_equal(typeof(tf), "logical")
  expect_equal(length(tf), 6)
  expect_output(str(tf), "logi [1:6]", fixed = TRUE)
  expect_equal(sum(tf, na.rm = TRUE), 3)
  expect_equal(mean(tf, trim = 0, na.rm = TRUE), 0.6)
  expect_equal(mean(tf, 0, TRUE), 0.6)
  
})
