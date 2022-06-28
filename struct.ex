# RETURN_GENERIC<MODULE_NAME, STRUCT_DEFAULT, MODULE_BYTES = 0..255>
# output: {:module, {{MODULE_NAME}}, <<{{MODULE_BYTES}}>>, {{STRUCT_DEFAULT}}}

defmodule Struct1 do
  @keys [:a, :b]
  @enforce_keys @keys
  defstruct @keys
end

# output: RETURN_GENERIC<Struct1, %Struct1{a: nil, b: nil}>

%Struct1{a: 1, b: 2}
# output: %Struct1{a: 1, b: 2}

# -*** *** ***-

defmodule Struct2 do
  @keys [:a, :b]
  @enforce_keys @keys
  defstruct (@keys -- [:a]) ++ [a: 42]
end

# output: RETURN_GENERIC<Struct2, %Struct2{a: 42, b: nil}>

%Struct2{b: 41}

# output: ** (ArgumentError) the following keys must also be given when building struct Struct2: [:a, :b] ...

# -*** *** ***-

defmodule Struct3 do
  defstruct [a: 1, b: 2, :c]
end

# output:
# unexpected expression after keyword list. Keyword lists must always come last in lists and maps...
#     [some: :value, :another]
#     %{some: :value, another => value}
# Instead, reorder it to be the last entry:
#     [:another, some: :value]
#     %{another => value, some: :value}

# -*** *** ***-

defmodule Struct4 do
  @keys [:a]
  @enforce_keys @keys
  defstruct @keys ++ [b: 42]
end

# output: RETURN_GENERIC<Struct4, %Struct4{a: nil, b: 42}>

%Struct4{}
# output: ** (ArgumentError) the following keys must also be given when building struct Struct4: [:a]

%Struct4{a: 41}
# output: %Struct4{a: 41, b: 42}

# -*** *** ***-

defmodule Struct5 do
  defstruct a: 42
end

# output: RETURN_GENERIC<Struct5, %Struct5{a: 42}>

%Struct5{}
# output: %Struct2{a: 42}

%Struct5{b: 41}
# output: ** (KeyError) key :b not found ...

# -*** *** ***-
