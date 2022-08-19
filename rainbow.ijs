load 'ansi.ijs'

colorize =: <@(' ' ansi~ ])
join_with_newlines =: (;@[,LF,;@])/
print =: 4 (1!:2)~ ]
void =: '' [ ]

NB. print a matrix of background color ansi codes as a box of colored spaces,
NB. where each 0-cell is an ansi code
matrix_to_color_2 =: 3 : 'join_with_newlines colorize"0 y'

NB. print a 3d matrix of background color ansi codes as a box of colored
NB. spaces, where each 1-cell is a sequence of ansi codes
matrix_to_color_3 =: 3 : 'join_with_newlines colorize"1 y'

NB. simple ansi 6-color rainbow, as arch and circle
NB. print with matrix_to_color_2
rainbow_arch =: ((10 <: ]) * (20 >: ]) * 41 + 6 | <.) %: (i. _20) (+&:*:)"0/ i: 20
rainbow_circle =: ((20 >: ]) * 41 + 6 | <.) %: (+&:*:)"0/~ i: 20

NB. turns hue angle in % of circle to rgb, assuming 100% hue and saturation
cxooxc =: 0 >. 1 <. 6 * (1%6) -~ [: (**) 0.5 -~ ]
rgb =: ([: cxooxc 1 | (0 _1 1 % 3) + ])"0
rgbi =: [: <. 255 * rgb

rgb_ansi =: 48 2 ,"1 ]
rainbow_square =: rgb_ansi rgbi 25 %~ i. 5 5
true_rainbow_arch =: ((1 > ]) * [: rgb_ansi [: rgbi 1 <. ]) 60 %~ %: (+&:*:)"0/~ i: 60

NB. Original one-liner which inspired these experiments:
NB. '' [ 4 (1!:2)~ (>@[,LF,>@])/ <@;"1 <@(' ' ansi~ ])"0 ((10 <: ]) * (20 >: ]) * 41 + 6 | <.) field
