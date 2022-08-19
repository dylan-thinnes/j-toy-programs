step =: |}.,+/
neq =: -.@:-:
push =: 1 : 'u,]'
iterate =: 2 : '(u @: {. push) ^: (v @: {.) ^: _'
cycle =: 4 : '(x & step) iterate (neq & y) ,: x step y'
to =: 4 : '(+ *&x)/ y'
