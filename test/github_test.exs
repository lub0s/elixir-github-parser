defmodule GithubTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  doctest Github

  test "has results" do
    String.length(capture_io("this is input", fn ->
      Github.run()
      IO.write("lupajz\n")
      IO.gets
    end)) == 0

  end
end
