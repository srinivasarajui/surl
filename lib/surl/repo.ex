defmodule Surl.Repo do
  use Ecto.Repo,
    otp_app: :surl,
    adapter: Ecto.Adapters.Postgres
end
