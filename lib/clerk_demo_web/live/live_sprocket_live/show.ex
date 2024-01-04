defmodule ClerkDemoWeb.LiveSprocketLive.Show do
  use ClerkDemoWeb, :live_view

  alias ClerkDemo.Sprockets

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:live_sprocket, Sprockets.get_live_sprocket!(id))}
  end

  defp page_title(:show), do: "Show Live sprocket"
  defp page_title(:edit), do: "Edit Live sprocket"
end
