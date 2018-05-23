defmodule SocialshareWeb.PostControllerTest do
  use SocialshareWeb.ConnCase

  alias Socialshare.Social

  @create_attrs %{comment: "some comment", shared: true, url: "some url"}
  @update_attrs %{comment: "some updated comment", shared: false, url: "some updated url"}
  @invalid_attrs %{comment: nil, shared: nil, url: nil}

  def fixture(:post) do
    {:ok, post} = Social.create_post(@create_attrs)
    post
  end

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get conn, post_path(conn, :index)
      assert html_response(conn, 200) =~ "New Post"
    end
  end

  describe "new post" do
    test "renders form", %{conn: conn} do
      conn = get conn, post_path(conn, :new)
      assert html_response(conn, 200) =~ "New Post"
    end
  end


end
