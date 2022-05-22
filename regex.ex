x = ~r/(?<!.)my name(?!.)/
# output: ~r/(?<!.)my name(?!.)/ (x -> ~r/(?<!.)my name(?!.)/)

Regex.match?(x, "my name")
# output: true

Regex.match?(x, "my name is martielo")
# output: false

Regex.match?(~r"with quotes", "with quotes")
# output: true

Regex.match?(~r{with brackets}, "with brackets")
# output: true

Regex.match?(~r[with brackets], "also with brackets")
# output: true

Regex.match?(~r(with brackets), "with, brackets?")
# output: false

%{source: y} = ~r/[a-z]+/
# output: ~r/[a-z]+/ (y -> "[a-z]+")

z = ~r/#{y} #{"[a-z]+"}/
# output: ~r/[a-z]+ [a-z]+/ (z -> ~r/[a-z]+ [a-z]+/)
