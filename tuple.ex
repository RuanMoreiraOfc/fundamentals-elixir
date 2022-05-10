x = {1, 2, 3}
# output: {1, 2, 3} (x -> {1, 2, 3})

x[0]
# output: (FunctionClauseError) no function clause matching in Access.get/3 ...

elem(x, 1)
# output: 2 (x -> {1, 2, 3})

put_elem(x, 3, 4)
# output: (ArgumentError) errors were found at the given arguments: ...

put_elem(x, 2, 4)
# output: {1, 2, 4} (x -> {1, 2, 3})
