defmodule ClerkDemoWeb.PageWidgetController do
  use ClerkDemoWeb, :controller

  alias ClerkDemo.Widgets
  alias ClerkDemo.Widgets.PageWidget

  def index(conn, _params) do
    page_widgets = Widgets.list_page_widgets()
    render(conn, :index, page_widgets: page_widgets)
  end

  def new(conn, _params) do
    changeset = Widgets.change_page_widget(%PageWidget{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"page_widget" => page_widget_params}) do
    case Widgets.create_page_widget(page_widget_params) do
      {:ok, page_widget} ->
        conn
        |> put_flash(:info, "Page widget created successfully.")
        |> redirect(to: ~p"/page_widgets/#{page_widget}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    page_widget = Widgets.get_page_widget!(id)
    render(conn, :show, page_widget: page_widget)
  end

  def edit(conn, %{"id" => id}) do
    page_widget = Widgets.get_page_widget!(id)
    changeset = Widgets.change_page_widget(page_widget)
    render(conn, :edit, page_widget: page_widget, changeset: changeset)
  end

  def update(conn, %{"id" => id, "page_widget" => page_widget_params}) do
    page_widget = Widgets.get_page_widget!(id)

    case Widgets.update_page_widget(page_widget, page_widget_params) do
      {:ok, page_widget} ->
        conn
        |> put_flash(:info, "Page widget updated successfully.")
        |> redirect(to: ~p"/page_widgets/#{page_widget}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, page_widget: page_widget, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    page_widget = Widgets.get_page_widget!(id)
    {:ok, _page_widget} = Widgets.delete_page_widget(page_widget)

    conn
    |> put_flash(:info, "Page widget deleted successfully.")
    |> redirect(to: ~p"/page_widgets")
  end
end
