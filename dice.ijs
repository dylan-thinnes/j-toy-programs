NB. a parser takes a string and returns 0 or more boxed values containing the
NB. parsed result and then one final box with the remaining text

split =: {. ; }.
take_by =:  ]: split ] NB. adverb: use u to produce a parser verb that splits y at (x u y)
into =: (].&.>@:{. , }.) @: [. NB. conjunction: use v to interpret the leftmost result of parser u
then =: (]. @: > @: {: ,~ }:) @: [. NB. sequence two parser verbs

NB. splitters
prefix =: #@:[ * [ -:&:, ({.~ #)~
many =: 0 i.~ e.~
any =: [: * 0 i.~ e.~

NB. parsers
constant =: prefix take_by
take_many =: many take_by
take_any =: any take_by
number =: '0123456789' & take_many into ".

NB. parse a die in {a}d{b}+{c} notation
parse_die =: number then ('d' take_any ]) then number then ('+-' take_any ]) then number

at =: [: > {
valid_parse =: (6 = #) *. (0 < [: # 2 at ]) *. ('d' = 1 at ]) *. (0 = [: # 5 at ])
