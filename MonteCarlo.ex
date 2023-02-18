
defmodule MonteCarlo do
  def main() do
    num_darts = 100000
    num_rounds = 1000
    radius = 100000
    #pi = rounds(num_darts, num_rounds, radius)
    #IO.puts("Actual PI - Estimation: #{:math.pi()} - #{pi} = #{:math.pi() - pi}")
    #IO.puts("Throwing #{num_darts} darts, #{num_rounds} times, with radius #{radius} gives \n PI = #{pi}")
    leibnitz(1000000)
  end

  def leibnitz(n) do
      4 * Enum.reduce(0..n, 0, fn(k,a) -> a + 1/(4*k + 1) - 1/(4*k + 3) end)
    end
  def rounds(k, j, r) do
    rounds(k, j, 0, r, 0)
  end
  def rounds(0, _, t, _, a) do
    IO.puts("Total darts = #{t}\n Total hits = #{a}\n PI = 4 * #{a} / #{t}")
    4*a/t
  end
  def rounds(k,j,t,r,a) do
    a = round(j,r,a)
    t = t+j
    pi = 4*a / t
    rounds(k-1, j, t, r, a)
  end

  def round(0, _, a) do a end
  def round(k, r, a) do
    if dart(r) do
      round(k-1, r, a+1)
    else
      round(k-1, r, a)
    end

  end

  def dart(r) do
    x = Enum.random(0..r)
    y = Enum.random(0..r)
    if((:math.pow(x, 2) + :math.pow(y, 2)) > :math.pow(r, 2)) do
      false
    else
      true
    end
  end


end
