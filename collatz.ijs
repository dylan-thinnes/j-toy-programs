collatz_step =: -: ` (1 + 3 * ]) @. (2&|)
NB. collatz =: ([ , collatz_step@{:) ^: (1 < {:) ^: _
iterate =: 2 : '([ , [: u {:) ^: ([: v {:) ^: _'
collatz =: collatz_step iterate (1 < ])
