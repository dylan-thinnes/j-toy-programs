NB. a parser takes a string and returns 0 or more boxed values containing the
NB. parsed result and then one final box with the remaining text

is_prefix =: [ -:&:, ({.~ #)~
to_parser =: (([. @: {. ; }.)~) ].
then =: (]. @: > @: {: ,~ }:) @: [.

constant =: [ to_parser (]: & (is_prefix * #@:[))
number =: ". to_parser (0 i.~ '0123456789' e.~ ])

parse_die =: number then ('d' constant) then number then ('+' constant) then number

at =: [: > {
valid_parse =: (6 = #) *. (0 < [: # 2 at ]) *. ('d' = 1 at ]) *. (0 = [: # 5 at ])
