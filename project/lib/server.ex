defmodule Project.Server do
  use GenServer

  def start_link(low,high) do
    GenServer.start_link(__MODULE__, [low, high])
  end

  def init(msgs) do
    a=Enum.at(msgs,0)
    b=Enum.at(msgs,1)
    if (not(a=="a") && not(b=="b")) do
      Project.Server.abc(a,b)
    else
      Project.Print.getlist()
    end

    {:ok, msgs}
  end

  def start(number) do
  	nos=to_string(number)
  	len=String.length(nos)
  	half_len=Kernel.trunc(div(len,2))
  	start=Kernel.trunc(:math.pow(10,half_len))
  	finish=Kernel.trunc(:math.sqrt(number))
  	multiple_of_3? =fn(n)-> rem(number,n)==0 end
  	_fangs=for n <- start..finish, multiple_of_3?.(n), do: [n,Kernel.trunc(div(number,n))]
  end

  def abc(nos,high) do
      nos..high
        |> Task.async_stream(&Project.Server.run/1, max_concurrency: System.schedulers_online)
        |> Enum.map(fn {:ok, _result} -> nil end)
  end

  def run(nos) do
    fangs=start(nos)
  	acc=[nos]
  	combo=Enum.reduce(fangs,acc, fn x,a->
  		if check(x,nos) do
  			_a=[a]++ x
  		else
  			a
  		end
  	end)
  	if (length(combo)==1) do

  	else
      Project.Print.add_n(combo)
  	end
  end

  def check(list,nos) do

  	[head|tail]=list
  	combined_nos=Enum.join(list)
   	digit=String.graphemes(to_string(combined_nos))
   	dd=Enum.sort(digit)
   	if Enum.join(dd)==(Enum.join(Enum.sort(String.graphemes(to_string(nos))))) do
   		if(Integer.mod(head,10)==0 && (Integer.mod(Enum.at(tail,0),10)==0)) do
        false
   	else
      true
   	end

   end

  end

end
