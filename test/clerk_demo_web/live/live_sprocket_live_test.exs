defmodule ClerkDemoWeb.LiveSprocketLiveTest do
  use ClerkDemoWeb.ConnCase

  import Phoenix.LiveViewTest
  import ClerkDemo.SprocketsFixtures

  @create_attrs %{name: "some name", user_id: "some user_id"}
  @update_attrs %{name: "some updated name", user_id: "some updated user_id"}
  @invalid_attrs %{name: nil, user_id: nil}

  defp create_live_sprocket(_) do
    live_sprocket = live_sprocket_fixture()
    %{live_sprocket: live_sprocket}
  end

  describe "Index" do
    setup [:create_live_sprocket]

    test "lists all live_sprockets", %{conn: conn, live_sprocket: live_sprocket} do
      {:ok, _index_live, html} = live(conn, ~p"/live_sprockets")

      assert html =~ "Listing Live sprockets"
      assert html =~ live_sprocket.name
    end

    test "saves new live_sprocket", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/live_sprockets")

      assert index_live |> element("a", "New Live sprocket") |> render_click() =~
               "New Live sprocket"

      assert_patch(index_live, ~p"/live_sprockets/new")

      assert index_live
             |> form("#live_sprocket-form", live_sprocket: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#live_sprocket-form", live_sprocket: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/live_sprockets")

      html = render(index_live)
      assert html =~ "Live sprocket created successfully"
      assert html =~ "some name"
    end

    test "updates live_sprocket in listing", %{conn: conn, live_sprocket: live_sprocket} do
      {:ok, index_live, _html} = live(conn, ~p"/live_sprockets")

      assert index_live
             |> element("#live_sprockets-#{live_sprocket.id} a", "Edit")
             |> render_click() =~
               "Edit Live sprocket"

      assert_patch(index_live, ~p"/live_sprockets/#{live_sprocket}/edit")

      assert index_live
             |> form("#live_sprocket-form", live_sprocket: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#live_sprocket-form", live_sprocket: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/live_sprockets")

      html = render(index_live)
      assert html =~ "Live sprocket updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes live_sprocket in listing", %{conn: conn, live_sprocket: live_sprocket} do
      {:ok, index_live, _html} = live(conn, ~p"/live_sprockets")

      assert index_live
             |> element("#live_sprockets-#{live_sprocket.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#live_sprockets-#{live_sprocket.id}")
    end
  end

  describe "Show" do
    setup [:create_live_sprocket]

    test "displays live_sprocket", %{conn: conn, live_sprocket: live_sprocket} do
      {:ok, _show_live, html} = live(conn, ~p"/live_sprockets/#{live_sprocket}")

      assert html =~ "Show Live sprocket"
      assert html =~ live_sprocket.name
    end

    test "updates live_sprocket within modal", %{conn: conn, live_sprocket: live_sprocket} do
      {:ok, show_live, _html} = live(conn, ~p"/live_sprockets/#{live_sprocket}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Live sprocket"

      assert_patch(show_live, ~p"/live_sprockets/#{live_sprocket}/show/edit")

      assert show_live
             |> form("#live_sprocket-form", live_sprocket: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#live_sprocket-form", live_sprocket: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/live_sprockets/#{live_sprocket}")

      html = render(show_live)
      assert html =~ "Live sprocket updated successfully"
      assert html =~ "some updated name"
    end
  end
end
