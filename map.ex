x = %{a: 1, b: 2, c: 3}
# output: %{a: 1, b: 2, c: 3} (x -> %{a: 1, b: 2, c: 3})

x.a
# output: 1

x['a']
# output: nil

x["a"]
# output: nil

Map.put(x, :d, 4)
# output: %{a: 1, b: 2, c: 3, d: 4} (x -> %{a: 1, b: 2, c: 3})

x = %{"a" => 1, "b" => 2, "c" => 3}
# output: %{"a" => 1, "b" => 2, "c" => 3} (x -> %{"a" => 1, "b" => 2, "c" => 3})

x.a
# output: (KeyError) key :a not found in: %{"a" => 1, "b" => 2, "c" => 3}

x['a']
# output: nil

x["a"]
# output: 1

Map.put(x, "d", 4)
# output: %{"a" => 1, "b" => 2, "c" => 3, "d" => 4} (x -> %{"a" => 1, "b" => 2, "c" => 3})

%{x | "c" => 4}
# output: %{"a" => 1, "b" => 2, "c" => 4} (x -> %{"a" => 1, "b" => 2, "c" => 3})

%{x | "d" => 4}
# output: (KeyError) key "d" not found in: %{"a" => 1, "b" => 2, "c" => 3}
