defmodule ScatOnSlack.GameEngine.Die do
  def throw, <<:rand.uniform(26) + 97>>
end
