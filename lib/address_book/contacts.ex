defmodule AddressBook.Contacts do
  use Ecto.Schema
  import Ecto.Changeset

  alias AddressBook.Repo, as: Repo

  schema "contacts" do
    field(:firstname, :string)
    field(:lastname, :string)
    field(:phone, :string)
    field(:created_at, :utc_datetime, default: DateTime.utc_now() |> DateTime.truncate(:second))
    field(:updated_at, :naive_datetime, default: NaiveDateTime.local_now())
  end

  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :email, :phone])
    |> validate_required([:name, :email, :phone])
  end

  # functions
  def list_contacts() do
    Repo.all(AddressBook.Contacts)
  end

  def get_contact(id) do
    # Repo.get(AddressBook.Contacts, id)
    case Repo.get(AddressBook.Contacts, id) do
      nil ->
        {:error, "Contact with id #{id} not found"}

      contact ->
        {:ok, contact}
    end
  end

  def create_contact(attrs) do
    %AddressBook.Contacts{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  @spec update_contact(any, any) :: none
  def update_contact(id, attrs) do
    case get_contact(id) do
      {:error, message} ->
        {:error, message}

      {:ok, contact} ->
        changeset(contact, attrs)
        |> Repo.update()
    end
  end

  def delete_contact(id) do
    case get_contact(id) do
      {:error, message} ->
        {:error, message}

      {:ok, contact} ->
        Repo.delete(contact)
        {:ok, "Contact deleted"}
    end
  end
end
