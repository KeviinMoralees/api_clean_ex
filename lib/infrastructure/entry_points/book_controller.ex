defmodule ApiClean.BookController do
  import Plug.Conn

  alias ApiClean.Domain.UseCase.BookUsecase

  def create(conn, %{"book" => book_params}) do
    case BookUsecase.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_status(:created)
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(%{data: book}))

      {:error, reason} ->
        conn
        |> put_status(400)
        |> put_resp_content_type("application/json")
        |> send_resp(422, Jason.encode!(%{error: reason}))
    end
  end

  def get(conn, %{"id" => id}) do
    case BookUsecase.get_book(id) do
      {:error, error} ->
        conn
        |> put_status(404)
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(%{error: error}))

      {:ok, book} ->
        conn
        |> put_status(200)
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(%{data: book}))
    end
  end

  def delete(conn, %{"id" => id}) do
    case BookUsecase.delete(id) do
      {:ok, _} ->
        conn
        |> put_status(204)
        |> send_resp(204, "")

      {:error, reason} ->
        conn
        |> put_status(404)
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(%{error: reason}))
    end
  end
end
