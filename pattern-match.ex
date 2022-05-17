x = 4
# output: 4 (x -> 4)

4 = x
# output: 4 (x -> 4)

5 = x
# output: ** (MatchError) no match of right hand side value: 4

^x = 4
# output: 4 (x -> 4)

^x = 5
# output: ** (MatchError) no match of right hand side value: 5

^y = 5
# output: ** (CompileError) undefined function y/0 (there is no such import)

# *** LIST ***

[x, y, z] = [1, 2, 3]
# output: [1, 2, 3] (x -> 1; y -> 2; z -> 3)

y
# output: 2 (y -> 2)

[x | _y] = [1, 2, 3]
# output: [1, 2, 3] (x -> 1; _y -> [2, 3])

x
# output: 1

_y
# output: warning: the underscored variable "_y" is used after being set. ...
# [2, 3]

[x | _] = [2, 3, 4]
# output: [2, 3, 4]

x
# output: 2

_
# output: ** (CompileError) invalid use of _. "_" represents a value to be ...

# *** TUPLE ***

{:ok, x} = {:ok, 12}
# output: {:ok, 12} (:ok == :ok; x -> 12)

{x, y} = {:ok, 12}
# output: {:ok, 12} (x -> :ok; y -> 12)

{:ok} = {:ok, 12}
# output: ** (MatchError) no match of right hand side value: {:ok, 12}

{:isOk, x} = {:ok, 12}
# output: ** (MatchError) no match of right hand side value: {:ok, 12}

# *** MAP ***

%{b: x} = %{a: 1, b: 2, c: 3}
# output: %{a: 1, b: 2, c: 3} (x -> 2)

x
# output: 2

%{b} = %{a: 1, b: 2, c: 3}
# output: ** (CompileError) expected key-value pairs in a map, got: b

%{b: x, a: y} = %{a: 1, b: 2, c: 3}
# output: %{a: 1, b: 2, c: 3} (x -> 2; y -> 1)

y
# output: 1

# *** ANONYMUS FUNCTION ***

x = fn a, b -> a + b end
# output: #Function<{{RANDOM_NUMBER}}/2 in :erl_eval.expr/5> (x -> { fn a, b -> a + b end } )

x(1, 2)
# output: ** (CompileError) undefined function x/2 (there is no such import)

x.(1, 2)
# output: 3 (x -> { fn a, b -> a + b end } )

x = fn
  {:ok, content} -> "ACTION SUCCESSFULLY EXECUTED -> #{content}"
  {:error, reason} -> "ACTION FAILED -> #{reason}"
end

# output: #Function<{{RANDOM_NUMBER}}/1 in :erl_eval.expr/5> (x -> {
#  fn
#    {:ok, content} -> "ACTION SUCCESSFULLY EXECUTED -> #{content}"
#    {:error, reason} -> "ACTION FAILED -> #{reason}"
#  end
# })

x.(File.read('./notFound.path'))
# output: "ACTION FAILED -> enoent" (x -> {
#  fn
#    {:ok, content} -> "ACTION SUCCESSFULLY EXECUTED -> #{content}"
#    {:error, reason} -> "ACTION FAILED -> #{reason}"
#  end
# })
