n =: 3 * 5 * 7

pure =: ''&;
combine =: (<@,&>)"0/

combinations =: , combine/ pure"0 ('Fizz';'Buzz';'Quux')
combinations =: (1 + i. n) ;"0 _/ }. combinations

idxs =: #. 0 = (3&| ,. 5&| ,. 7&|) 1 + i. n

result =: ,. idxs {"0 1 combinations
