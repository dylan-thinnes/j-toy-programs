NB. black tile black piece = outline white
NB. black tile white piece = fill    white
NB. white tile black piece = fill    black
NB. white tile white piece = outline black

ESC =: 27 { a.
bg =: [: ": 40 + 7 * [
fg =: [: ": 30 + 7 * 0 = [
char =: (u: 32 , 16b2654 + i. 12) {~ (*@] * 1 + (6 | <:@]) + 6 * [ 6 b. 6 < ])
out =: ESC , '[' , bg , ';' , fg , 'm' , char , ESC , '[0m' []

back =: 0 = 1 = (+ |:) 2 | i. 8 8
black_rows =: 6 ,: 3 5 4 2 1 4 5 3
white_rows =: 6 + black_rows
start =: (|. black_rows) , 0 , 0 , 0 , 0 , white_rows

get =: ,@[ {~ 8 8 #. ]
mask =: (i. 8 8) e. 8 8 #. ]
unset =: * -.@mask
move =: unset + mask@:{:@] * (get {.)
show_mask =: [: u: 16b2591 16b2588 {~ ]

render =: ,@:(out"0)"1

relative_coords =: ((#: i.) 8 8) -"1 ]
bishop_mask =: [: =/"1 [: (**) relative_coords
rook_mask =: [: +./"1 [] 0 = relative_coords
queen_mask =: rook_mask +. bishop_mask
knight_mask =: (0 0 , 1 2 ,: 2 1) e.~ [: (**) relative_coords

file =: 'abcdefgh' i. ]
rank =: '12345678' i. ]
piece =: [: <. 2 %~ 'kKqQrRbBnN' i. ]

parse_file =: (] ; (}.~ 8 ~: ])) file@{.
parse_rank =: (] ; (}.~ 8 ~: ])) rank@{.
parse_piece =: (] ; (}.~ 5 ~: ])) piece@{.
parse_takes =: (] ; }.~) 'x' = {.
after =: ([,>@:])/ @: ([ ` ([. &. >) " 0) @: ].
