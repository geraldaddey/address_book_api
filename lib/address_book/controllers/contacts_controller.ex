defmodule AddressBook.Controller.Contact do
  alias AddressBook.Repo
  alias AddressBook.Schema.Contact


  # @spec list_contacts :: {:error, <<_::136>>} | {:ok, list
  def list_contacts() do
    case  Repo.all(Contact) do
      [] ->
        {:error, "No contacts found"}

      contacts ->
        {:ok, retrieve_contact_details(contacts)}
    end
  end

  def retrieve_contact_details(contacts) do
    Enum.map(contacts, fn contact ->
      %{
        id: contact.id,
        first_name: contact.firstname,
        last_name: contact.lastname,
        phone: contact.phone,
        user: contact.user_id,
        suburb: contact.suburb_id
      }
    end)
  end

  def get_contact(id) do
    # Repo.get(AddressBook.Contacts, id)
    case Repo.get(Contact, id) do
      nil ->
        {:error, "Contact with id #{id} not found"}

      contact ->
        IO.inspect(contact)
        {:ok, retrieve_contact_details(contact)}
    end
  end

  @spec create_contact(
          :invalid
          | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: {:error, any} | {:ok, any}
  def create_contact(attrs) do
    changeset = Contact.changeset(%Contact{}, attrs)

    case Repo.insert(changeset) do
      {:ok, result} ->
        {:ok, result}

      {:error, reason} ->
        {:error, reason}
    end
  end


  def update_contact(id, attrs) do
    case get_contact(id) do
      {:error, message} ->
        {:error, message}

      {:ok, contact} ->
        Contact.changeset(contact, attrs)
        |> Repo.update()
    end
  end

   def delete_contact(id) do
    case get_contact(id) do
      {:error, message} ->
        {:error, message}

      {:ok, contact} ->
        new_contact = Contact.changeset(contact, %{active_status: false, del_status: true})
        Repo.update(new_contact)
        {:ok, "Contact deleted"}
    end
  end
end
