x = %{a: 1, b: 2}
y = :a

case Map.get(x, y) do
  nil -> {:error, "Key not found!"}
  value -> {:ok, value}
end

# output: {:ok, 1}

z = :c

case Map.get(x, z) do
  nil -> {:error, "Key not found!"}
  value -> {:ok, value}
end

# output: {:error, "Key not found!"}
