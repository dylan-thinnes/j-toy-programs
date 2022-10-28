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

length =: #
at =: [: > {
nothing_left =: '' -: 5 at ]
infix_d_number =: ('d' -: 1 at ]) *. ([: -. '' -: 2 at ])
delta_or_nothing =: ('' -: 4 at ]) +. ('+-' e.~ 3 at ])

valid_parse =: (6 -: length) *. nothing_left *. infix_d_number *. delta_or_nothing
numeric_and_nonempty =: ([: * #) *. 1 4 e.~ 3!:0
default_number =: [`]@.([: numeric_and_nonempty ])
extract_spec =: (1 default_number 0 at ]) , (2 at ]) , ((1 - 2 * '-' e. 3 at ]) * 0 default_number 4 at ])

roll_spec =: [: ,~`(1 + [: ? $)/ _1 |. ]
expected =: [: +`([ * 2 %~ 1 + ])/ _1 |. ]
roll_stats =: ([ ; ] ; +/@:] ; expected@:[) roll_spec
