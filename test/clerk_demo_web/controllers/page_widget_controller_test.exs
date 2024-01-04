defmodule ClerkDemoWeb.PageWidgetControllerTest do
  use ClerkDemoWeb.ConnCase

  import ClerkDemo.WidgetsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all page_widgets", %{conn: conn} do
      conn = get(conn, ~p"/page_widgets")
      assert html_response(conn, 200) =~ "Listing Page widgets"
    end
  end

  describe "new page_widget" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/page_widgets/new")
      assert html_response(conn, 200) =~ "New Page widget"
    end
  end

  describe "create page_widget" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/page_widgets", page_widget: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/page_widgets/#{id}"

      conn = get(conn, ~p"/page_widgets/#{id}")
      assert html_response(conn, 200) =~ "Page widget #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/page_widgets", page_widget: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Page widget"
    end
  end

  describe "edit page_widget" do
    setup [:create_page_widget]

    test "renders form for editing chosen page_widget", %{conn: conn, page_widget: page_widget} do
      conn = get(conn, ~p"/page_widgets/#{page_widget}/edit")
      assert html_response(conn, 200) =~ "Edit Page widget"
    end
  end

  describe "update page_widget" do
    setup [:create_page_widget]

    test "redirects when data is valid", %{conn: conn, page_widget: page_widget} do
      conn = put(conn, ~p"/page_widgets/#{page_widget}", page_widget: @update_attrs)
      assert redirected_to(conn) == ~p"/page_widgets/#{page_widget}"

      conn = get(conn, ~p"/page_widgets/#{page_widget}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, page_widget: page_widget} do
      conn = put(conn, ~p"/page_widgets/#{page_widget}", page_widget: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Page widget"
    end
  end

  describe "delete page_widget" do
    setup [:create_page_widget]

    test "deletes chosen page_widget", %{conn: conn, page_widget: page_widget} do
      conn = delete(conn, ~p"/page_widgets/#{page_widget}")
      assert redirected_to(conn) == ~p"/page_widgets"

      assert_error_sent 404, fn ->
        get(conn, ~p"/page_widgets/#{page_widget}")
      end
    end
  end

  defp create_page_widget(_) do
    page_widget = page_widget_fixture()
    %{page_widget: page_widget}
  end
end
