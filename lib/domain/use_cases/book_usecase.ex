defmodule ApiClean.Domain.UseCase.BookUsecase do
  @moduledoc """
  BookUsecase
  """

  alias ApiClean.Infrastructure.Adapters.Repository.RepositoryBooks.RepositoryBooksDataRepository

  @behaviour ApiClean.Domain.Behaviours.BookBehaviour

  @impl true
  def create_book(book) do
    RepositoryBooksDataRepository.create_book(book)
  end

  @impl true
  def get_book(id) do
    RepositoryBooksDataRepository.get_book(id)
  end

  @impl true
  def delete(id) do
    RepositoryBooksDataRepository.delete(id)
  end

  ## TODO Add functions to business logic app
end
