defmodule AddressBook.Schema.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  # alias AddressBook.Repo, as: Repo

  schema "contacts" do
    field(:firstname, :string)
    field(:lastname, :string)
    field(:phone, :string)
    field(:created_at, :utc_datetime, default: DateTime.utc_now() |> DateTime.truncate(:second))
    field(:updated_at, :naive_datetime, default: NaiveDateTime.local_now())
    belongs_to(:user, AddressBook.Schema.User)
    belongs_to(:suburb, AddressBook.Schema.Suburb)
  end

  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:firstname, :lastname, :phone, :user, :suburb])
    |> validate_required([:firstname, :lastname, :phone])
  end

end
