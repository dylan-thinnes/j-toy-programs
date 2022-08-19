NB. Take neighbour sums along x and y axes, it's a beautiful day in the neighbourhood
along_y =: 3 +/\ {: , [ , {.
along_x =: |: @: along_y @: |:

NB. Alternative implementation of along_x
NB. along_x =: 3 (+/\"1) {:"1 ,"0 1 [ ,"1 0 {."1

NB. Take a step, don't look back
step =: (([ *. 2 = ]) +. 3 = ]) along_x @ along_y - ]

NB. Generate n steps with a starting field, like germinating a humble seed
multistep =: 4 : 0
(step @ {. , ]) ^: x ,: y
)

NB. Visualize field(s) nicely into nice little boxes with nice little fields
visual =: { & ' #'
boxes =: <"2

NB. Initialize a glider in a large empty field, where it has plenty of space to roam and be free
glider =: 0 1 0 , 1 0 0 ,: 1 1 1
field =: 0 ,"1^:5 (0 ,~^:5 glider)

NB. Example - run along your track little glider, come along now
example =: boxes visual 32 multistep field
