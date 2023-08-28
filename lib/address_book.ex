defmodule AddressBook.Router do
  use Plug.Router

  alias AddressBook.Contacts

  # define middleware
  plug(:match)
  plug(:dispatch)

  # define routes
  get "/" do
    IO.inspect(conn)
    send_resp(conn, 200, "Welcome to the Address Book API")
  end

  # get all contacts
  get "/contacts" do
    contacts = Contacts.list_contacts()
    send_resp(conn, 200, Poison.encode!(%{resp_code: '200', resp_msg: contacts}))
    case  Contacts.list_contacts() do
      {:ok, result} ->
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(200, Poison.encode!(Map.put(Constant.success(), data: result)))
    end
  end

  # get specific contact
  get "/contacts/:id" do
    id = conn.params["id"]
    contact = Contacts.get_contact(id)
    send_resp(conn, 200, contact)
  end

  # create a new contact‰
  post "/contacts" do
    contact_params = conn.params["contact"]
    contact = Contacts.create_contact(contact_params)
    send_resp(conn, 201, contact)
  end

  # update an existing contact
  put "/contacts/:id" do
    id = conn.params["id"]
    contact_params = conn.params["contact"]
    contact = Contacts.update_contact(id, contact_params)
    send_resp(conn, 200, contact)
  end

  # delete a contact
  delete "contacts/:id" do
    id = conn.params["id"]
  Contacts.delete_contact(id)
    send_resp(conn, 204, "")
  end
end
