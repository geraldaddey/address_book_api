defmodule AddressBook.Router do
  use Plug.Router
  alias AddressBook.Controller.Contact

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
    case Contact.list_contacts() do
      {:ok, result} ->
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(200, Poison.encode!(%{response_code: 200, data: result}))

      {:error, reason} ->
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(500, Poison.encode!(%{resp_code: 500, data: reason}))
    end
  end

  # get specific contact
  get "/contacts/:id" do
    id = conn.params["id"]
    case Contact.get_contact(id) do
      {:ok, contact} ->
        send_resp(conn, 200, Poison.encode!(%{resp_code: 200, data: contact}))

      {:error, reason} ->
        send_resp(conn, 404, Poison.encode!(%{resp_code: 500, data: reason}))
    end
  end

  # delete a contact
  delete "contacts/:id" do
    id = conn.params["id"]
    Contact.delete_contact(id)
    send_resp(conn, 204, "")
  end

  # get specific contact
  get "/contacts/:id" do
    id = conn.params["id"]


    case Contact.get_contact(id) do
      contact ->
        send_resp(conn, 200, Poison.encode!(%{resp_code: '200', resp_msg: contact}))
      nil ->
        send_resp(conn, 404, Poison.encode!(%{resp_code: '404', resp_msg: "Contact with id #{id} not found"}))
    end
  end

  # create a new contact
  post "/contacts" do
    {:ok, body, conn} = read_body(conn)

    case Poison.decode(body) do
      {:ok, parsed} ->
      case Contact.create_contact(parsed) do
        {:ok, result} ->
          conn
          |> put_status(201)
          |> put_resp_header("content-type", "application/json")
          |> send_resp(201, Poison.encode!(result))

        {:error, reason} ->
          conn
          |> put_status(400)
          |> put_resp_header("content-type", "application/json")
          |> send_resp(400, Poison.encode!(reason))
      end
      {:error, reason} ->
        conn
        |> put_status(400)
        |> put_resp_header("content-type", "application/json")
        |> send_resp(400, Poison.encode!(reason))
    end
  end

  # update an existing contact
 put "/contacts/:id" do
    contact_id = conn.params["id"]
    {:ok, body, conn} = read_body(conn)
    {:ok, details} = Poison.decode(body)

    case Contact.update_contact(contact_id, details) do
      {:ok, contact} ->
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(200, Poison.encode!(%{resp_code: "00", contact: contact}))
      {:notfound} ->
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(404, Poison.encode!(%{resp_code: "01", message: "Contact does not exist"}))
    end
  end

  # delete a contact
  delete "contacts/:id" do
    id = conn.params["id"]
    Contact.delete_contact(id)
    send_resp(conn, 204, "")
  end
end
