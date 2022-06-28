# RETURN_GENERIC<MODULE_NAME, FN, FN_PARAMS_COUNT, MODULE_BYTES = 0..255>
# output: {:module, {{MODULE_NAME}}, <<{{MODULE_BYTES}}>>, {:{{FN}}, {{FN_PARAMS_COUNT}} }}

defmodule Stack do
  use GenServer

  # Client

  def start_link(initial_stack) when is_list(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack)
  end

  def push(pid, element) do
    GenServer.call(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (Callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  # SYCN
  @impl true
  def handle_call({:push, element}, _from, stack) do
    new_stack = [element | stack]

    {:reply, new_stack, new_stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | new_stack]) do
    {:reply, head, new_stack}
  end

  @impl true
  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  # ASYCN
  @impl true
  def handle_cast({:push, element}, stack) do
    new_stack = [element | stack]

    {:noreply, new_stack, new_stack}
  end

  @impl true
  def handle_cast(:pop, [_head | new_stack]) do
    {:noreply, new_stack}
  end

  @impl true
  def handle_cast(:pop, []) do
    {:noreply, []}
  end

  # send(pid, message)
  @impl true
  def handle_info(message, state) do
    IO.inspect(state, label: message)

    {:noreply, state}
  end
end

# output: RETURN_GENERIC<Stack, handle_info, 2>

{:ok, pid} = Stack.start_link([0])
# output: {:ok, #PID<<RANDOM_PROCESS_ID>>} (pid -> #PID<<RANDOM_PROCESS_ID>>)  [pid_state -> [0]]

Stack.push(pid, 1)
# output: [0, 1] (pid -> #PID<<RANDOM_PROCESS_ID>>) [pid_state -> [1, 0]]

Stack.pop(pid)
# output: 1 (pid -> #PID<<RANDOM_PROCESS_ID>>) [pid_state -> [0]]

GenServer.cast(pid, :pop)
# output: :ok (pid -> #PID<<RANDOM_PROCESS_ID>>) [pid_state -> []]

GenServer.cast(nil, :pop)
# output: :ok

GenServer.call(pid, :anything_not_defined)
# output: [error] GenServer #PID<<RANDOM_PROCESS_ID>> terminating

send(pid, :anything)
# IO: anything: [0]
# output: :anything
