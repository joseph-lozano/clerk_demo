defmodule ClerkDemoWeb.UserLiveAuth do
  import Phoenix.Component
  import Phoenix.LiveView

  def on_mount(:default, _params, %{"user_id" => user_id} = _session, socket) do
    dbg(user_id)
    socket = assign(socket, :user_id, user_id)

    if socket.assigns.user_id do
      ClerkDemoWeb.Endpoint.subscribe("users_socket:#{user_id}")
      {:cont, socket}
    else
      socket =
        socket
        |> put_flash(:error, "You must be logged in to access this page.")
        |> redirect(to: "/")

      {:halt, socket}
    end
  end
end
