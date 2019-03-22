defmodule Tasks.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :desc, :string
    field :done, :boolean, default: false
    field :name, :string
    field :time, :integer
    belongs_to :user, Tasks.Users.User

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :desc, :time, :done, :user_id])
    |> validate_required([:name, :desc, :time, :done, :user_id])
  end
end
