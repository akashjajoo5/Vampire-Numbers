defmodule Project.Supervisor do
  use Supervisor

  def start_link(l) do
    Supervisor.start_link(__MODULE__, l)
  end

  def init(l) do
    low = Enum.at(l,0)
    high = Enum.at(l,1)
    split=Kernel.trunc(div(high-low,8))
    children = [
      worker(Project.Print, [[]]),
      worker(Project.Server, [low,low+split], [id: 10]),
      worker(Project.Server, [low+split,low+2*split], [id: 11]),
      worker(Project.Server, [low+2*split,low+3*split], [id: 12]),
      worker(Project.Server, [low+3*split,low+4*split], [id: 13]),
      worker(Project.Server, [low+4*split,low+5*split], [id: 14]),
      worker(Project.Server, [low+5*split,low+6*split], [id: 15]),
      worker(Project.Server, [low+6*split,low+7*split], [id: 16]),
      worker(Project.Server, [low+7*split,high], [id: 17]),
      worker(Project.Server, ["a","a"], [id: 18])
    ]

    supervise(children, strategy: :one_for_one)
  end

end
