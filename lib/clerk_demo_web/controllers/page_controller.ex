defmodule ClerkDemoWeb.PageController do
  use ClerkDemoWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    get_session(conn)["user_id"]
    |> IO.inspect(label: "home")

    dbg(conn.req_cookies)

    render(conn, :home, layout: false)
  end

  def api(conn, _params) do
    dbg(conn.assigns)
    json(conn, %{message: "Welcome to ClerkDemo!"})
  end

  def sign_out(conn, _params) do
    user_id = get_session(conn)["user_id"]
    ClerkDemoWeb.Endpoint.broadcast("users_socket:#{user_id}", "sign-out", %{})

    conn
    |> put_session(:user_id, nil)
    |> redirect(to: "/")
  end
end
