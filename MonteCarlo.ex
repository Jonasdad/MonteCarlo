
defmodule MonteCarlo do
  def main() do

    rounds(1000, 100, 5)
  end
  def rounds(k, j, r) do
    rounds(k, j, 0, r, 0)
  end
  def rounds(0, _, t, _, a) do
    t/a
  end
  def rounds(k,j,t,r,a) do
    a = round(j,r,a)
    t = t+j
    pi = a / t
    :io.format("pi", [pi, pi - :math.pi()])
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
