defmodule ClerkDemoWeb.Router do
  use ClerkDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ClerkDemoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_user_id
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug :ensure_user_id
  end

  scope "/", ClerkDemoWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/sign-out", PageController, :sign_out

    live_session :default, on_mount: ClerkDemoWeb.UserLiveAuth do
      live "/live_sprockets", LiveSprocketLive.Index, :index
      live "/live_sprockets/new", LiveSprocketLive.Index, :new
      live "/live_sprockets/:id/edit", LiveSprocketLive.Index, :edit

      live "/live_sprockets/:id", LiveSprocketLive.Show, :show
      live "/live_sprockets/:id/show/edit", LiveSprocketLive.Show, :edit
    end
  end

  scope "/", ClerkDemoWeb do
    pipe_through [:browser, :protected]
    resources "/page_widgets", PageWidgetController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ClerkDemoWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:clerk_demo, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ClerkDemoWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  def fetch_user_id(conn, _opts) do
    user_id =
      conn.req_cookies["__session"]
      |> then(fn
        nil ->
          nil

        session ->
          case ClerkDemo.Token.verify_and_validate(session) do
            {:ok, %{"sub" => user_id}} -> user_id
            _ -> nil
          end
      end)

    user_id
    |> then(fn 
      nil -> conn
      user_id -> put_session(conn, :user_id, user_id)
    end)
    |> assign(:user_id, user_id)
  end

  def ensure_user_id(conn, _opts) do
    case conn.assigns.user_id do
      nil ->
        conn
        |> put_flash(:error, "You must be logged in to access this page.")
        |> redirect(to: "/")
        |> halt()

      _ ->
        conn
    end
  end
end
