defmodule Github do
  def read_input do
    IO.gets("Username ?: ")
  end

  def build_url(username \\ "lupajz") do
    "https://api.github.com/users/" <> (username |> String.slice(0..-2)) <> "/repos"
  end

  def handle_json({:ok, %{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  def handle_json({_, %{status_code: _, body: _}}) do
    IO.puts("Something went wrong. Please check your internet connection")
  end

  def run do
    read_input()
    |> build_url
    |> HTTPoison.get()
    |> handle_json
    |> Github.Repository.unmarshall()
  end
end
