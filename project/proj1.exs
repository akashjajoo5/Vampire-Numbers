defmodule Proj1 do
  def start do
      Project.Supervisor.start_link([String.to_integer(Enum.at(System.argv(), 0)), String.to_integer(Enum.at(System.argv(), 1))])
  end
end

Proj1.start
