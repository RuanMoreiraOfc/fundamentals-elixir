{:ok, agent} = Agent.start_link(fn -> %{} end)
# output: {:ok, #PID<{{RANDOM_NUMBER}}.{{RANDOM_NUMBER}}.{{RANDOM_NUMBER}}>} (agent -> #PID)

Agent.update(agent, fn oldState -> Map.put(oldState, :any, :thing) end)
# output: :ok (agent -> #PID)

Agent.get(agent, fn state -> state end)
# output: %{any: :thing} (agent -> #PID)
