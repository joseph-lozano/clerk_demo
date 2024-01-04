defmodule ClerkDemoWeb.LiveSprocketLive.FormComponent do
  use ClerkDemoWeb, :live_component

  alias ClerkDemo.Sprockets

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage live_sprocket records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="live_sprocket-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Live sprocket</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{live_sprocket: live_sprocket} = assigns, socket) do
    changeset = Sprockets.change_live_sprocket(live_sprocket)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"live_sprocket" => live_sprocket_params}, socket) do
    changeset =
      socket.assigns.live_sprocket
      |> Sprockets.change_live_sprocket(live_sprocket_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"live_sprocket" => live_sprocket_params}, socket) do
    save_live_sprocket(socket, socket.assigns.action, live_sprocket_params)
  end

  defp save_live_sprocket(socket, :edit, live_sprocket_params) do
    case Sprockets.update_live_sprocket(socket.assigns.live_sprocket, live_sprocket_params) do
      {:ok, live_sprocket} ->
        notify_parent({:saved, live_sprocket})

        {:noreply,
         socket
         |> put_flash(:info, "Live sprocket updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_live_sprocket(socket, :new, live_sprocket_params) do
    case Sprockets.create_live_sprocket(live_sprocket_params) do
      {:ok, live_sprocket} ->
        notify_parent({:saved, live_sprocket})

        {:noreply,
         socket
         |> put_flash(:info, "Live sprocket created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
