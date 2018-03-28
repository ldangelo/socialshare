defmodule Socialshare.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Socialshare.Repo

  alias Socialshare.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Socialshare.Accounts.Linkedin

  @doc """
  Returns the list of linkedin.

  ## Examples

      iex> list_linkedin()
      [%Linkedin{}, ...]

  """
  def list_linkedin do
    Repo.all(Linkedin)
  end

  @doc """
  Gets a single linkedin.

  Raises `Ecto.NoResultsError` if the Linkedin does not exist.

  ## Examples

      iex> get_linkedin!(123)
      %Linkedin{}

      iex> get_linkedin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_linkedin!(id), do: Repo.get!(Linkedin, id)

  @doc """
  Creates a linkedin.

  ## Examples

      iex> create_linkedin(%{field: value})
      {:ok, %Linkedin{}}

      iex> create_linkedin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_linkedin(attrs \\ %{}) do
    %Linkedin{}
    |> Linkedin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a linkedin.

  ## Examples

      iex> update_linkedin(linkedin, %{field: new_value})
      {:ok, %Linkedin{}}

      iex> update_linkedin(linkedin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_linkedin(%Linkedin{} = linkedin, attrs) do
    linkedin
    |> Linkedin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Linkedin.

  ## Examples

      iex> delete_linkedin(linkedin)
      {:ok, %Linkedin{}}

      iex> delete_linkedin(linkedin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_linkedin(%Linkedin{} = linkedin) do
    Repo.delete(linkedin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking linkedin changes.

  ## Examples

      iex> change_linkedin(linkedin)
      %Ecto.Changeset{source: %Linkedin{}}

  """
  def change_linkedin(%Linkedin{} = linkedin) do
    Linkedin.changeset(linkedin, %{})
  end

  alias Socialshare.Accounts.Google

  @doc """
  Returns the list of google.

  ## Examples

      iex> list_google()
      [%Google{}, ...]

  """
  def list_google do
    Repo.all(Google)
  end

  @doc """
  Gets a single google.

  Raises `Ecto.NoResultsError` if the Google does not exist.

  ## Examples

      iex> get_google!(123)
      %Google{}

      iex> get_google!(456)
      ** (Ecto.NoResultsError)

  """
  def get_google!(id), do: Repo.get!(Google, id)

  @doc """
  Creates a google.

  ## Examples

      iex> create_google(%{field: value})
      {:ok, %Google{}}

      iex> create_google(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_google(attrs \\ %{}) do
    %Google{}
    |> Google.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a google.

  ## Examples

      iex> update_google(google, %{field: new_value})
      {:ok, %Google{}}

      iex> update_google(google, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_google(%Google{} = google, attrs) do
    google
    |> Google.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Google.

  ## Examples

      iex> delete_google(google)
      {:ok, %Google{}}

      iex> delete_google(google)
      {:error, %Ecto.Changeset{}}

  """
  def delete_google(%Google{} = google) do
    Repo.delete(google)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking google changes.

  ## Examples

      iex> change_google(google)
      %Ecto.Changeset{source: %Google{}}

  """
  def change_google(%Google{} = google) do
    Google.changeset(google, %{})
  end
end
