# RETURN_GENERIC<MODULE_NAME, FN, FN_PARAMS_COUNT, MODULE_BYTES = 0..255>
# output: {:module, {{MODULE_NAME}}, <<{{MODULE_BYTES}}>>, {:{{FN}}, {{FN_PARAMS_COUNT}} }}

defmodule Module1 do
  def call(), do: 42
end

# output: RETURN_GENERIC<Module1, call, 0>

Module1.call()
# output: 42

# -*** *** ***-

defmodule Module2 do
  def call(multiplier) when is_integer(multiplier) do
    42 * multiplier
  end

  def call(_multiplier) do
    42
  end
end

# output: RETURN_GENERIC<Module2, call, 1>

Module2.call(2)
# output: 84

Module2.call(2.0)
# output: 42

Module2.call(nil)
# output: 42

# -*** *** ***-

defmodule Module3 do
  def call() do
    call_only_inside()
  end

  defp call_only_inside(), do: 42
end

# output: RETURN_GENERIC<Module3, call_only_inside, 0>

Module3.call()
# output: 42

Module3.call_only_inside()
# output: (UndefinedFunctionError) function Module3.call_only_inside/0 is undefined or private

# -*** *** ***-

defmodule Module4 do
  @module_constant 42

  def call() do
    @module_constant
  end
end

Module4.call()
# output: 42

Module4.@module_constant
# ** (CompileError) undefined function module_constant/0 (there is no such import)
