context("hello")

test_that("hello tests", {
  h <- hello()
  expect_is(h, "character")
  expect_equal(h, c("Hello, world!"))
})
