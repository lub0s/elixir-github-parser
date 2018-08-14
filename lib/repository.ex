defmodule Github.Repository do
  def unmarshall(map) do
    {:ok, body} = map

    Enum.map(body, fn repo -> get_in(repo, ["name"]) end)
  end
end
