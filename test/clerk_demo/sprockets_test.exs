defmodule ClerkDemo.SprocketsTest do
  use ClerkDemo.DataCase

  alias ClerkDemo.Sprockets

  describe "live_sprockets" do
    alias ClerkDemo.Sprockets.LiveSprocket

    import ClerkDemo.SprocketsFixtures

    @invalid_attrs %{name: nil, user_id: nil}

    test "list_live_sprockets/0 returns all live_sprockets" do
      live_sprocket = live_sprocket_fixture()
      assert Sprockets.list_live_sprockets() == [live_sprocket]
    end

    test "get_live_sprocket!/1 returns the live_sprocket with given id" do
      live_sprocket = live_sprocket_fixture()
      assert Sprockets.get_live_sprocket!(live_sprocket.id) == live_sprocket
    end

    test "create_live_sprocket/1 with valid data creates a live_sprocket" do
      valid_attrs = %{name: "some name", user_id: "some user_id"}

      assert {:ok, %LiveSprocket{} = live_sprocket} = Sprockets.create_live_sprocket(valid_attrs)
      assert live_sprocket.name == "some name"
      assert live_sprocket.user_id == "some user_id"
    end

    test "create_live_sprocket/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sprockets.create_live_sprocket(@invalid_attrs)
    end

    test "update_live_sprocket/2 with valid data updates the live_sprocket" do
      live_sprocket = live_sprocket_fixture()
      update_attrs = %{name: "some updated name", user_id: "some updated user_id"}

      assert {:ok, %LiveSprocket{} = live_sprocket} =
               Sprockets.update_live_sprocket(live_sprocket, update_attrs)

      assert live_sprocket.name == "some updated name"
      assert live_sprocket.user_id == "some updated user_id"
    end

    test "update_live_sprocket/2 with invalid data returns error changeset" do
      live_sprocket = live_sprocket_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Sprockets.update_live_sprocket(live_sprocket, @invalid_attrs)

      assert live_sprocket == Sprockets.get_live_sprocket!(live_sprocket.id)
    end

    test "delete_live_sprocket/1 deletes the live_sprocket" do
      live_sprocket = live_sprocket_fixture()
      assert {:ok, %LiveSprocket{}} = Sprockets.delete_live_sprocket(live_sprocket)
      assert_raise Ecto.NoResultsError, fn -> Sprockets.get_live_sprocket!(live_sprocket.id) end
    end

    test "change_live_sprocket/1 returns a live_sprocket changeset" do
      live_sprocket = live_sprocket_fixture()
      assert %Ecto.Changeset{} = Sprockets.change_live_sprocket(live_sprocket)
    end
  end
end
