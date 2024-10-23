is_prime <- function(n) {
  if (n <= 1) {
    return(FALSE)
  }
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}

prime_numbers <- c()
for (num in 2:1000) {
  if (is_prime(num)) {
    prime_numbers <- c(prime_numbers, num)
  }
}

print(prime_numbers)
