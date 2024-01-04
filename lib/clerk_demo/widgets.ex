defmodule ClerkDemo.Widgets do
  @moduledoc """
  The Widgets context.
  """

  import Ecto.Query, warn: false
  alias ClerkDemo.Repo

  alias ClerkDemo.Widgets.PageWidget

  @doc """
  Returns the list of page_widgets.

  ## Examples

      iex> list_page_widgets()
      [%PageWidget{}, ...]

  """
  def list_page_widgets do
    Repo.all(PageWidget)
  end

  @doc """
  Gets a single page_widget.

  Raises `Ecto.NoResultsError` if the Page widget does not exist.

  ## Examples

      iex> get_page_widget!(123)
      %PageWidget{}

      iex> get_page_widget!(456)
      ** (Ecto.NoResultsError)

  """
  def get_page_widget!(id), do: Repo.get!(PageWidget, id)

  @doc """
  Creates a page_widget.

  ## Examples

      iex> create_page_widget(%{field: value})
      {:ok, %PageWidget{}}

      iex> create_page_widget(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_page_widget(attrs \\ %{}) do
    %PageWidget{}
    |> PageWidget.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a page_widget.

  ## Examples

      iex> update_page_widget(page_widget, %{field: new_value})
      {:ok, %PageWidget{}}

      iex> update_page_widget(page_widget, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_page_widget(%PageWidget{} = page_widget, attrs) do
    page_widget
    |> PageWidget.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a page_widget.

  ## Examples

      iex> delete_page_widget(page_widget)
      {:ok, %PageWidget{}}

      iex> delete_page_widget(page_widget)
      {:error, %Ecto.Changeset{}}

  """
  def delete_page_widget(%PageWidget{} = page_widget) do
    Repo.delete(page_widget)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking page_widget changes.

  ## Examples

      iex> change_page_widget(page_widget)
      %Ecto.Changeset{data: %PageWidget{}}

  """
  def change_page_widget(%PageWidget{} = page_widget, attrs \\ %{}) do
    PageWidget.changeset(page_widget, attrs)
  end
end
