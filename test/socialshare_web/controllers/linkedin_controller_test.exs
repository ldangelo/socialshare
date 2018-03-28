defmodule SocialshareWeb.LinkedinControllerTest do
  use SocialshareWeb.ConnCase

  alias Socialshare.Accounts

  @create_attrs %{email: "some email", expiration: ~D[2010-04-17], expired: true, name: "some name", token: "some token"}
  @update_attrs %{email: "some updated email", expiration: ~D[2011-05-18], expired: false, name: "some updated name", token: "some updated token"}
  @invalid_attrs %{email: nil, expiration: nil, expired: nil, name: nil, token: nil}

  def fixture(:linkedin) do
    {:ok, linkedin} = Accounts.create_linkedin(@create_attrs)
    linkedin
  end

  describe "index" do
    test "lists all linkedin", %{conn: conn} do
      conn = get conn, linkedin_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Linkedin"
    end
  end

  describe "new linkedin" do
    test "renders form", %{conn: conn} do
      conn = get conn, linkedin_path(conn, :new)
      assert html_response(conn, 200) =~ "New Linkedin"
    end
  end

  describe "create linkedin" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, linkedin_path(conn, :create), linkedin: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == linkedin_path(conn, :show, id)

      conn = get conn, linkedin_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Linkedin"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, linkedin_path(conn, :create), linkedin: @invalid_attrs
      assert html_response(conn, 200) =~ "New Linkedin"
    end
  end

  describe "edit linkedin" do
    setup [:create_linkedin]

    test "renders form for editing chosen linkedin", %{conn: conn, linkedin: linkedin} do
      conn = get conn, linkedin_path(conn, :edit, linkedin)
      assert html_response(conn, 200) =~ "Edit Linkedin"
    end
  end

  describe "update linkedin" do
    setup [:create_linkedin]

    test "redirects when data is valid", %{conn: conn, linkedin: linkedin} do
      conn = put conn, linkedin_path(conn, :update, linkedin), linkedin: @update_attrs
      assert redirected_to(conn) == linkedin_path(conn, :show, linkedin)

      conn = get conn, linkedin_path(conn, :show, linkedin)
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, linkedin: linkedin} do
      conn = put conn, linkedin_path(conn, :update, linkedin), linkedin: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Linkedin"
    end
  end

  describe "delete linkedin" do
    setup [:create_linkedin]

    test "deletes chosen linkedin", %{conn: conn, linkedin: linkedin} do
      conn = delete conn, linkedin_path(conn, :delete, linkedin)
      assert redirected_to(conn) == linkedin_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, linkedin_path(conn, :show, linkedin)
      end
    end
  end

  defp create_linkedin(_) do
    linkedin = fixture(:linkedin)
    {:ok, linkedin: linkedin}
  end
end
