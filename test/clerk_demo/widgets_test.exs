defmodule ClerkDemo.WidgetsTest do
  use ClerkDemo.DataCase

  alias ClerkDemo.Widgets

  describe "page_widgets" do
    alias ClerkDemo.Widgets.PageWidget

    import ClerkDemo.WidgetsFixtures

    @invalid_attrs %{name: nil}

    test "list_page_widgets/0 returns all page_widgets" do
      page_widget = page_widget_fixture()
      assert Widgets.list_page_widgets() == [page_widget]
    end

    test "get_page_widget!/1 returns the page_widget with given id" do
      page_widget = page_widget_fixture()
      assert Widgets.get_page_widget!(page_widget.id) == page_widget
    end

    test "create_page_widget/1 with valid data creates a page_widget" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %PageWidget{} = page_widget} = Widgets.create_page_widget(valid_attrs)
      assert page_widget.name == "some name"
    end

    test "create_page_widget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Widgets.create_page_widget(@invalid_attrs)
    end

    test "update_page_widget/2 with valid data updates the page_widget" do
      page_widget = page_widget_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %PageWidget{} = page_widget} =
               Widgets.update_page_widget(page_widget, update_attrs)

      assert page_widget.name == "some updated name"
    end

    test "update_page_widget/2 with invalid data returns error changeset" do
      page_widget = page_widget_fixture()
      assert {:error, %Ecto.Changeset{}} = Widgets.update_page_widget(page_widget, @invalid_attrs)
      assert page_widget == Widgets.get_page_widget!(page_widget.id)
    end

    test "delete_page_widget/1 deletes the page_widget" do
      page_widget = page_widget_fixture()
      assert {:ok, %PageWidget{}} = Widgets.delete_page_widget(page_widget)
      assert_raise Ecto.NoResultsError, fn -> Widgets.get_page_widget!(page_widget.id) end
    end

    test "change_page_widget/1 returns a page_widget changeset" do
      page_widget = page_widget_fixture()
      assert %Ecto.Changeset{} = Widgets.change_page_widget(page_widget)
    end
  end
end
