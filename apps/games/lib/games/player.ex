defmodule ScatOnSlack.Games.Player do

  use Bank.Model
  alias ScatOnSlack.Games.Group

  schema "players" do
    field :email, :string
    field :team, :string

    belongs_to :group, Group

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(username email)a)
    |> validate_required(~w(username email)a)
    |> unique_constraint(:username)
  end

  """
    def build(%{username: username} = params) do
      changeset(%Customer{}, params)
      |> put_assoc(:wallet, Ledger.Account.build_wallet("Wallet: #{username}"))
    end
  """

end
