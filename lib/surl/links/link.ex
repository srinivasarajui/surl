defmodule Surl.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :hash, :string
    field :ref_count, :integer
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:hash, :url, :ref_count])
    |> validate_required([:hash, :url, :ref_count])
    |> unique_constraint(:hash)
    |> unique_constraint(:url)
  end
end
