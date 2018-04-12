defmodule Socialshare.SocialTest do
  use Socialshare.DataCase

  alias Socialshare.Social

  describe "posts" do
    alias Socialshare.Social.Post

    @valid_attrs %{comment: "some comment", shared: true, url: "some url"}
    @update_attrs %{comment: "some updated comment", shared: false, url: "some updated url"}
    @invalid_attrs %{comment: nil, shared: nil, url: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Social.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Social.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Social.create_post(@valid_attrs)
      assert post.comment == "some comment"
      assert post.shared == true
      assert post.url == "some url"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = Social.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.comment == "some updated comment"
      assert post.shared == false
      assert post.url == "some updated url"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_post(post, @invalid_attrs)
      assert post == Social.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Social.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Social.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Social.change_post(post)
    end
  end
end
