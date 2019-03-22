defmodule Tasks.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :admin, :boolean, default: false
    has_many :tasks, Tasks.Events.Event

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :admin])
    |> unique_constraint(:email)
    |> validate_required([:email, :admin])
  end
end
