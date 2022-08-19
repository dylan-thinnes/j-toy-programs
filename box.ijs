NB. zot =: ((<: = i.) + (0 < i.))
NB. zot =: i. I.~ 0 , -&2
zot =: 0 , 2 ,~ 1 #~ -&2
indices =: zot@[ +/ 3 * zot@]
box =: a. {~ 16 25 22 26 32 26 18 25 24 {~ indices
square =: [: u: 9623 9616 9629 9604 9608 9600 9622 9612 9624 {~ indices
