NB. a parser takes a string and returns 0 or more boxed values containing the
NB. parsed result and then one final box with the remaining text

is_prefix =: [ -:&:, ({.~ #)~
to_parser =: (([. @: {. ; }.)~) ].
then =: (]. @: > @: {: ,~ }:) @: [.

many_of =: [. to_parser ((0 []) i.~ (]. (e.~) ]))
one_of =: [. to_parser ([: * ((0 []) i.~ (]. (e.~) ])))
number =: ". many_of '0123456789'

parse_die =: number then ([ one_of 'd') then number then ([ one_of '+-') then number

at =: [: > {
valid_parse =: (6 = #) *. (0 < [: # 2 at ]) *. ('d' = 1 at ]) *. (0 = [: # 5 at ])
