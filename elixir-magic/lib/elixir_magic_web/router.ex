defmodule ElixirMagicWeb.Router do
  use ElixirMagicWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", ElixirMagicWeb do
    pipe_through(:api)
    get("/hello", ApiController, :hello)
  end
end
