defmodule ETTest do
  use ExUnit.Case
  doctest ET

  test "greets the world" do
    assert ET.hello() == :world
  end
end
