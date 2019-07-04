defmodule FinTex.Model.Bank do
  @moduledoc """
    Provides a default implementation of the `FinTex.User.FinBank` protocol.

    The following fields are public:
    * `blz`     - 8 digits bank code
    * `url`     - URL of the bank server
    * `version` - API version. Possible values are `220` or `300`.
  """

  alias FinTex.User.FinBank

  @type t :: %__MODULE__{
          blz: binary,
          url: binary,
          version: binary
        }

  defstruct [
    :blz,
    :url,
    :version
  ]

  def valid?, do: true

  @doc false
  @spec from_fin_bank(term) :: t
  def from_fin_bank(fin_bank) do
    %__MODULE__{
      blz: fin_bank |> FinBank.blz(),
      url: fin_bank |> FinBank.url(),
      version: fin_bank |> FinBank.version()
    }
  end
end
