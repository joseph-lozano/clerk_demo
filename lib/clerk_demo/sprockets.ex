defmodule ClerkDemo.Sprockets do
  @moduledoc """
  The Sprockets context.
  """

  import Ecto.Query, warn: false
  alias ClerkDemo.Repo

  alias ClerkDemo.Sprockets.LiveSprocket

  @doc """
  Returns the list of live_sprockets.

  ## Examples

      iex> list_live_sprockets()
      [%LiveSprocket{}, ...]

  """
  def list_live_sprockets do
    Repo.all(LiveSprocket)
  end

  @doc """
  Gets a single live_sprocket.

  Raises `Ecto.NoResultsError` if the Live sprocket does not exist.

  ## Examples

      iex> get_live_sprocket!(123)
      %LiveSprocket{}

      iex> get_live_sprocket!(456)
      ** (Ecto.NoResultsError)

  """
  def get_live_sprocket!(id), do: Repo.get!(LiveSprocket, id)

  @doc """
  Creates a live_sprocket.

  ## Examples

      iex> create_live_sprocket(%{field: value})
      {:ok, %LiveSprocket{}}

      iex> create_live_sprocket(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_live_sprocket(attrs \\ %{}) do
    %LiveSprocket{}
    |> LiveSprocket.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a live_sprocket.

  ## Examples

      iex> update_live_sprocket(live_sprocket, %{field: new_value})
      {:ok, %LiveSprocket{}}

      iex> update_live_sprocket(live_sprocket, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_live_sprocket(%LiveSprocket{} = live_sprocket, attrs) do
    live_sprocket
    |> LiveSprocket.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a live_sprocket.

  ## Examples

      iex> delete_live_sprocket(live_sprocket)
      {:ok, %LiveSprocket{}}

      iex> delete_live_sprocket(live_sprocket)
      {:error, %Ecto.Changeset{}}

  """
  def delete_live_sprocket(%LiveSprocket{} = live_sprocket) do
    Repo.delete(live_sprocket)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking live_sprocket changes.

  ## Examples

      iex> change_live_sprocket(live_sprocket)
      %Ecto.Changeset{data: %LiveSprocket{}}

  """
  def change_live_sprocket(%LiveSprocket{} = live_sprocket, attrs \\ %{}) do
    LiveSprocket.changeset(live_sprocket, attrs)
  end
end
