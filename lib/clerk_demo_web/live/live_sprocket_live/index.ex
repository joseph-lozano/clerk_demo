defmodule ClerkDemoWeb.LiveSprocketLive.Index do
  use ClerkDemoWeb, :live_view

  alias ClerkDemo.Sprockets
  alias ClerkDemo.Sprockets.LiveSprocket

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :live_sprockets, Sprockets.list_live_sprockets())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Live sprocket")
    |> assign(:live_sprocket, Sprockets.get_live_sprocket!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Live sprocket")
    |> assign(:live_sprocket, %LiveSprocket{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Live sprockets")
    |> assign(:live_sprocket, nil)
  end

  @impl true
  def handle_info({ClerkDemoWeb.LiveSprocketLive.FormComponent, {:saved, live_sprocket}}, socket) do
    {:noreply, stream_insert(socket, :live_sprockets, live_sprocket)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    live_sprocket = Sprockets.get_live_sprocket!(id)
    {:ok, _} = Sprockets.delete_live_sprocket(live_sprocket)

    {:noreply, stream_delete(socket, :live_sprockets, live_sprocket)}
  end
end
