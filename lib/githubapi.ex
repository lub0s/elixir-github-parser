defmodule Github do
  def printContents(ofUrl) do
    Application.ensure_all_started(:inets)
    Application.ensure_all_started(:ssl)

    result = HTTPoison.get(ofUrl, [], ssl: [{:versions, [:"tlsv1.2"]}])

    case result do
      {:ok, response } ->
        IO.puts(response.body)

      {:error, { _term, _id, _reason }} ->
        IO.puts("Error happened")

    end
  end

  def readInput do
    IO.gets("Username ?: ")
  end

  def buildUrl(username \\ "lupajz") do
    "https://api.github.com/users/" <> (username |> String.slice(0..-2)) <> "/repos"
  end

  def run do
    readInput()
    |> buildUrl
    |> printContents
  end
end
