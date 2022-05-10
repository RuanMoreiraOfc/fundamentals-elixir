:ok
# output: :ok

:error
# output: :error

true
# output: true

false
# output: false

true and :ok
# output: false

false && false
# output: true

true or :ok
# output: true

:ok or true
# output: (BadBooleanError) expected a boolean on left-side of "or", got: :ok

:ok || true
# output: :ok
