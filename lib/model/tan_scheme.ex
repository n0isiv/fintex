defmodule FinTex.Model.TANScheme do
  @moduledoc """
  The following fields are public:
    * `name`        - TAN scheme name
    * `medium_name` - TAN medium name
    * `sec_func`    - encoded security function
    * `format`      - Challenge data format. Possible values are `:text`, `:html`, `:hhd` or `:matrix`.
    * `label`       - response label
  """

  alias FinTex.User.FinTANScheme

  @type t :: %__MODULE__{
    name: binary,
    medium_name: binary,
    medium_name_required: boolean,
    sec_func: pos_integer,
    format: atom,
    label: binary,
    v: pos_integer
  }

  defstruct [
    :name,
    :medium_name,
    :medium_name_required,
    :sec_func,
    :format,
    :label,
    :v
  ]

  use Vex.Struct

  validates :sec_func, presence: true,
                  length: [min: 1, max: 3]

  validates :medium_name, length: [min: 1, max: 255]


  @doc false
  @spec from_tan_scheme(FinTANScheme.t) :: t
  def from_tan_scheme(tan_scheme) do
    %__MODULE__{
      sec_func:    tan_scheme |> FinTANScheme.sec_func,
      medium_name: tan_scheme |> FinTANScheme.medium_name
    }
  end
end
