defmodule ElixirMagicWeb.ApiController do
  use ElixirMagicWeb, :controller

  def hello(conn, params) do
    case params do
      %{"person" => _} -> json(conn, %{message: "Hello #{params["person"]}"})
    end
  end
end
