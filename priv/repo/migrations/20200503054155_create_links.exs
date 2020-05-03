defmodule Surl.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :hash, :string
      add :url, :string
      add :ref_count, :integer

      timestamps()
    end

    create unique_index(:links, [:hash])
    create unique_index(:links, [:url])
  end
end
