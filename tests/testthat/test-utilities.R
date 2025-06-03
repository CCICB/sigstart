test_that("fix_alleles_scalar works correctly", {
  result <- fix_alleles_scalar("ATCG", "ATG")
  expect_equal(result$ref, "CG")
  expect_equal(result$alt, "G")
  expect_equal(result$numdropped, 2)

  result <- fix_alleles_scalar("A", "T")
  expect_equal(result$ref, "A")
  expect_equal(result$alt, "T")
  expect_equal(result$numdropped, 0)

  result <- fix_alleles_scalar("AT", "A-")
  expect_equal(result$ref, "T")
  expect_equal(result$alt, "-")
  expect_equal(result$numdropped, 1)
})

test_that("fix_alleles works correctly", {
  ref <- c("ATCG", "A", "AT")
  alt <- c("ATG", "T", "A-")
  result <- fix_alleles(ref, alt)

  expect_equal(result$ref, c("CG", "A", "T"))
  expect_equal(result$alt, c("G", "T", "-"))
  expect_equal(result$numdropped, c(2, 0, 1))
})

