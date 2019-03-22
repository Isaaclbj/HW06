defmodule TasksWeb.Router do
  use TasksWeb, :router

  pipeline :browser do

    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TasksWeb.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TasksWeb do
    pipe_through :browser
    resources "/events", EventController
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:delete, :create], singleton: true
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TasksWeb do
  #   pipe_through :api
  # end
end
