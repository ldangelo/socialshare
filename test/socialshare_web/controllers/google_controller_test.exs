defmodule SocialshareWeb.GoogleControllerTest do
  use SocialshareWeb.ConnCase

  alias Socialshare.Accounts

  @create_attrs %{email: "some email", expiration: ~D[2010-04-17], expired: true, name: "some name", token: "some token"}
  @update_attrs %{email: "some updated email", expiration: ~D[2011-05-18], expired: false, name: "some updated name", token: "some updated token"}
  @invalid_attrs %{email: nil, expiration: nil, expired: nil, name: nil, token: nil}

  def fixture(:google) do
    {:ok, google} = Accounts.create_google(@create_attrs)
    google
  end

  describe "index" do
    test "lists all google", %{conn: conn} do
      conn = get conn, google_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Google"
    end
  end

  describe "new google" do
    test "renders form", %{conn: conn} do
      conn = get conn, google_path(conn, :new)
      assert html_response(conn, 200) =~ "New Google"
    end
  end

  describe "create google" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, google_path(conn, :create), google: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == google_path(conn, :show, id)

      conn = get conn, google_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Google"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, google_path(conn, :create), google: @invalid_attrs
      assert html_response(conn, 200) =~ "New Google"
    end
  end

  describe "edit google" do
    setup [:create_google]

    test "renders form for editing chosen google", %{conn: conn, google: google} do
      conn = get conn, google_path(conn, :edit, google)
      assert html_response(conn, 200) =~ "Edit Google"
    end
  end

  describe "update google" do
    setup [:create_google]

    test "redirects when data is valid", %{conn: conn, google: google} do
      conn = put conn, google_path(conn, :update, google), google: @update_attrs
      assert redirected_to(conn) == google_path(conn, :show, google)

      conn = get conn, google_path(conn, :show, google)
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, google: google} do
      conn = put conn, google_path(conn, :update, google), google: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Google"
    end
  end

  describe "delete google" do
    setup [:create_google]

    test "deletes chosen google", %{conn: conn, google: google} do
      conn = delete conn, google_path(conn, :delete, google)
      assert redirected_to(conn) == google_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, google_path(conn, :show, google)
      end
    end
  end

  defp create_google(_) do
    google = fixture(:google)
    {:ok, google: google}
  end
end
