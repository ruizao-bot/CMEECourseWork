for (i in 1:10) {
  # Check if 'i' is even (remainder is 0 when divided by 2)
  if ((i %% 2) == 0) # check if the number is odd
    next # pass to next iteration of loop 
  print(i)
}