x = [1, 2, 3]
# output: [1, 2, 3] (x -> [1, 2, 3])

x[0]
# output: (ArgumentError) the Access calls for keywords expect the key to be an atom, got: 0

hd(x)
# output: 1 (x -> [1, 2, 3])

tl(x)
# output: [2, 3] (x -> [1, 2, 3])

x ++ [4]
# output: [1, 2, 3 ,4] (x -> [1, 2, 3])

x = x -- [1, 4]
# output: [2, 3] (x -> [2, 3])
