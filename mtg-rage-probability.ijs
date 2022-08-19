hand_size=: 11
sample_count=: 1000000
possible_counts=: i. 1 + hand_size

gate_counts=: 4 3 3 2 2 2 2 2 2 2 1 4
gates=: gate_counts # 1 + i. $ gate_counts
deck=: gates , 0 $~ 60 - $ gates

deal_unique_gates=: 3 : 0
  $~.[#~>.&0 deck {~ hand_size ? 60
)

samples=: , deal_unique_gates"0 i. sample_count
occurences=: +/ possible_counts (="1 0) samples
prob=: occurences % sample_count

cumtri=: |.|."1 >:/~ possible_counts
cumprob=: +/ cumtri * prob
revprob=: 1 - 0 , }: cumprob

echo (i. 1 + hand_size) ,. prob ,. cumprob ,. revprob
