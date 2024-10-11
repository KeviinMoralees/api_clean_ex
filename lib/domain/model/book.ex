defmodule ApiClean.Domain.Model.Book do
  @moduledoc """
  Book
  """
  @derive {Jason.Encoder, only: [:title, :author]}
  defstruct [:title, :author]

  def new(title, author) do
    %__MODULE__{
      title: title,
      author: author
    }
  end
end
