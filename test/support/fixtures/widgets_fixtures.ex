defmodule ClerkDemo.WidgetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClerkDemo.Widgets` context.
  """

  @doc """
  Generate a page_widget.
  """
  def page_widget_fixture(attrs \\ %{}) do
    {:ok, page_widget} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ClerkDemo.Widgets.create_page_widget()

    page_widget
  end
end
