defmodule Socialshare.AccountsTest do
  use Socialshare.DataCase

  alias Socialshare.Accounts

  describe "users" do
    alias Socialshare.Accounts.User

    @valid_attrs %{admin: true, email: "some email", name: "some name"}
    @update_attrs %{admin: false, email: "some updated email", name: "some updated name"}
    @invalid_attrs %{admin: nil, email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.admin == true
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.admin == false
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "linkedin" do
    alias Socialshare.Accounts.Linkedin

    @valid_attrs %{email: "some email", expiration: ~D[2010-04-17], expired: true, name: "some name", token: "some token"}
    @update_attrs %{email: "some updated email", expiration: ~D[2011-05-18], expired: false, name: "some updated name", token: "some updated token"}
    @invalid_attrs %{email: nil, expiration: nil, expired: nil, name: nil, token: nil}

    def linkedin_fixture(attrs \\ %{}) do
      {:ok, linkedin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_linkedin()

      linkedin
    end

    test "list_linkedin/0 returns all linkedin" do
      linkedin = linkedin_fixture()
      assert Accounts.list_linkedin() == [linkedin]
    end

    test "get_linkedin!/1 returns the linkedin with given id" do
      linkedin = linkedin_fixture()
      assert Accounts.get_linkedin!(linkedin.id) == linkedin
    end

    test "create_linkedin/1 with valid data creates a linkedin" do
      assert {:ok, %Linkedin{} = linkedin} = Accounts.create_linkedin(@valid_attrs)
      assert linkedin.email == "some email"
      assert linkedin.expiration == ~D[2010-04-17]
      assert linkedin.expired == true
      assert linkedin.name == "some name"
      assert linkedin.token == "some token"
    end

    test "create_linkedin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_linkedin(@invalid_attrs)
    end

    test "update_linkedin/2 with valid data updates the linkedin" do
      linkedin = linkedin_fixture()
      assert {:ok, linkedin} = Accounts.update_linkedin(linkedin, @update_attrs)
      assert %Linkedin{} = linkedin
      assert linkedin.email == "some updated email"
      assert linkedin.expiration == ~D[2011-05-18]
      assert linkedin.expired == false
      assert linkedin.name == "some updated name"
      assert linkedin.token == "some updated token"
    end

    test "update_linkedin/2 with invalid data returns error changeset" do
      linkedin = linkedin_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_linkedin(linkedin, @invalid_attrs)
      assert linkedin == Accounts.get_linkedin!(linkedin.id)
    end

    test "delete_linkedin/1 deletes the linkedin" do
      linkedin = linkedin_fixture()
      assert {:ok, %Linkedin{}} = Accounts.delete_linkedin(linkedin)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_linkedin!(linkedin.id) end
    end

    test "change_linkedin/1 returns a linkedin changeset" do
      linkedin = linkedin_fixture()
      assert %Ecto.Changeset{} = Accounts.change_linkedin(linkedin)
    end
  end

  describe "google" do
    alias Socialshare.Accounts.Google

    @valid_attrs %{email: "some email", expiration: ~D[2010-04-17], expired: true, name: "some name", token: "some token"}
    @update_attrs %{email: "some updated email", expiration: ~D[2011-05-18], expired: false, name: "some updated name", token: "some updated token"}
    @invalid_attrs %{email: nil, expiration: nil, expired: nil, name: nil, token: nil}

    def google_fixture(attrs \\ %{}) do
      {:ok, google} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_google()

      google
    end

    test "list_google/0 returns all google" do
      google = google_fixture()
      assert Accounts.list_google() == [google]
    end

    test "get_google!/1 returns the google with given id" do
      google = google_fixture()
      assert Accounts.get_google!(google.id) == google
    end

    test "create_google/1 with valid data creates a google" do
      assert {:ok, %Google{} = google} = Accounts.create_google(@valid_attrs)
      assert google.email == "some email"
      assert google.expiration == ~D[2010-04-17]
      assert google.expired == true
      assert google.name == "some name"
      assert google.token == "some token"
    end

    test "create_google/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_google(@invalid_attrs)
    end

    test "update_google/2 with valid data updates the google" do
      google = google_fixture()
      assert {:ok, google} = Accounts.update_google(google, @update_attrs)
      assert %Google{} = google
      assert google.email == "some updated email"
      assert google.expiration == ~D[2011-05-18]
      assert google.expired == false
      assert google.name == "some updated name"
      assert google.token == "some updated token"
    end

    test "update_google/2 with invalid data returns error changeset" do
      google = google_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_google(google, @invalid_attrs)
      assert google == Accounts.get_google!(google.id)
    end

    test "delete_google/1 deletes the google" do
      google = google_fixture()
      assert {:ok, %Google{}} = Accounts.delete_google(google)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_google!(google.id) end
    end

    test "change_google/1 returns a google changeset" do
      google = google_fixture()
      assert %Ecto.Changeset{} = Accounts.change_google(google)
    end
  end
end
