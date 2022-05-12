x = fn -> 42 end
# output: #Function<{{RANDOM_NUMBER}}/0 in :erl_eval.expr/5> (x -> { fn -> 42 end })

x = & &1
# output: #Function<{{RANDOM_NUMBER}}/1 in :erl_eval.expr/5> (x -> { fn arg1 -> arg1 end })

x = fn a -> a end
# output: #Function<{{RANDOM_NUMBER}}/1 in :erl_eval.expr/5> (x -> { fn a -> a end })

y = & &1.(21)
# output: #Function<{{RANDOM_NUMBER}}/1 in :erl_eval.expr/5> (y -> { fn fnArg -> fnArg.(21) end })

z = &(&1 * 2)
# output: #Function<{{RANDOM_NUMBER}}/1 in :erl_eval.expr/5> (z -> { fn arg1 -> arg1 * 2 end })

y.(z)
# output: 42 ( y.(z) -> {
#   fn fnArg ->
#     21 |> fnArg(
#       fn a -> a * 2
#     end)
#   end
# })
