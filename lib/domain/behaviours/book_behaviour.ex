defmodule ApiClean.Domain.Behaviours.BookBehaviour do

    @callback create_book(map()):: {:ok, term()} | {:error, term()}
    @callback get_book(integer()):: {:ok, term()} | {:error, term()}
    @callback delete(integer()):: {:ok, term()} | {:error, term()}

end
