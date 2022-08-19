perms =: (#: i.@:<:@:(*/)) @: >:
power_perms =: */"1 @ ([ ^"1 perms@])
factors =: [: power_perms/ __ q: ]
perfect_sum =: +/@factors"0
is_perfect =: = perfect_sum
filter_perfect =: #~ [ = perfect_sum
perfect_numbers_under =: filter_perfect @: >: @: i.
