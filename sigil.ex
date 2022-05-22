# possibilities
# ~sigil_any/ /
# ~sigil_any| |
# ~sigil_any" "
# ~sigil_any' '
# ~sigil_any( )
# ~sigil_any[ ]
# ~sigil_any{ }
# ~sigil_any< >


~S"""
using template string
but without concatenation
"""

# output: "using template string\nbut without concatenation\n"

~S"""
#{this gonna be escaped} and
this `\n` not gonna break the line
"""

# output: "\#{this gonna be escaped} and \nthis `\\n` not gonna break the line\n"

~s(this gonna me escaped "" and this too '')
# output: "\#{this gonna be escaped} and \nthis `\\n` not gonna break the line\n"

~s/\#{this need to be escaped manually/
# output: "\#{this gonna be escaped} and \nthis `\\n` not gonna break the line\n"

~s{this too `\\n` needs to be escaped manually}
# output: "\#{this gonna be escaped} and \nthis `\\n` not gonna break the line\n"

~w<foo bar>a
# output: ["foo", "bar"]

~w<a b c>:a
# output: [:a, :b, :c]

# -*** *** ***-

defmodule MyCustomSigils do
  def sigil_i(string, []), do: String.to_integer(string)
  def sigil_i(string, [?n]), do: -String.to_integer(string)
end
# See more in module.ex

MyCustomSigils.sigil_i("13", [])
# output: 13

MyCustomSigils.sigil_i("14", [?n])
# output: -14

import MyCustomSigils

~i(13)
# output: 13

~i(42)n
# output: -42
