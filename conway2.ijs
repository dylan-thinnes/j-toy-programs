glider =: 6 7 8 11 17 e.~ i. 5 5 NB. make a glider
field =: {. glider ,: 10 10 $ 0 NB. put glider into big open field

shifts =: (- , ]) <: 3 3 #: i. 4
neighbours =: [: +/ shifts |."1 2 ]
step =: neighbours
