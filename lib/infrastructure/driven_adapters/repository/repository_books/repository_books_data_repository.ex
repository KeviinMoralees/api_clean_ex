defmodule ApiClean.Infrastructure.Adapters.Repository.RepositoryBooks.RepositoryBooksDataRepository do

  alias ApiClean.Infrastructure.Adapters.Repository.Repo
  alias ApiClean.Infrastructure.Adapters.Repository.RepositoryBooks.Data.RepositoryBooksData
  alias ApiClean.Domain.Model.Book

  @behaviour ApiClean.Domain.Behaviours.BookBehaviour




  def get_book(id) do
    case RepositoryBooksData |> Repo.get(id) |> to_entity do
      nil -> {:error, "Book not found"}
      book -> {:ok, book}
    end
  end

  def delete(id) do
    case RepositoryBooksData |> Repo.get(id) do
      nil -> {:error, "Book not found"}
      book ->
        case Repo.delete(book) do
          {:ok, _} -> {:ok, book}
          {:error, reason} -> {:error, reason}
        end
    end
  end

  def create_book(entity) do
    IO.inspect(entity)
    IO.inspect(to_data(entity))
     case to_data(entity) |> Repo.insert() do
       {:ok, entity} -> {:ok, entity |> to_entity()}
       error -> {:error, error}
     end
  end

  #mappers
  defp to_entity(nil), do: nil

  # defp to_entity(data) do
  #   struct(Book, data |> Map.from_struct)
  # end

  # defp to_data(entity) do
  #   struct(RepositoryBooksData, entity |> Map.from_struct())
  # end

  defp to_entity(%RepositoryBooksData{ title: title, author: author}) do
    %Book{
      title: title,
      author: author
    }
  end

  defp to_data(%{"author" => author, "title" => title}) do
    %RepositoryBooksData{
      title: title,
      author: author
    }
  end

end
