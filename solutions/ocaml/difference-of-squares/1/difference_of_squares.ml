let sum_series n = (n * (n + 1)) / 2

let square_of_sum n = 
  let x = sum_series n
  in x * x

let sum_of_squares n =
  ((n * n + n) * (2 * n + 1)) / 6

let difference_of_squares n  =
  square_of_sum n - sum_of_squares n 


