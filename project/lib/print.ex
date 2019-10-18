defmodule Project.Print do
  use GenServer

  def start_link(list) do
    GenServer.start_link(__MODULE__,list, name: :ps)
  end

  def init(list) do
    {:ok,list}
  end

  def add_n(n) do
    GenServer.cast(:ps,{:ai, n})
  end

  def getlist() do
    GenServer.call(:ps,:gl)
  end

  def handle_cast({:ai, n}, list) do
    {:noreply, [n | list]}
  end

  def handle_call(:gl, _from, list) do
    l=list
    l=Enum.reverse(l)
    l=Enum.map(l, fn x-> List.flatten(x) end)
    Enum.map(l, fn x-> IO.puts(Enum.join(x," ")) end)
    {:reply, list, list}
  end
end
