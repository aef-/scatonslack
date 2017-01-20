defmodule ScatOnSlack.Games.Player do

  alias ScatOnSlack.Games.User

  schema "groups" do
    field :name, :string
    field :url, :string

    has_many :users, User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(name url)a)
    |> validate_required(~w(name url)a)
    |> unique_constraint(:url)
  end

  """
    def build(%{username: username} = params) do
      changeset(%Customer{}, params)
      |> put_assoc(:wallet, Ledger.Account.build_wallet("Wallet: #{username}"))
    end
  """

end
