defmodule FinTex.Helper.Checksum do
  @moduledoc false

  @spec luhn(String.t(), 2..36) :: integer
  def luhn(input, base), do: Luhn.checksum(input, base)

  @spec xor(String.t()) :: String.t()
  def xor(input) when is_binary(input) do
    use Bitwise
    import FinTex.Helper.Conversion

    input
    |> String.codepoints()
    |> Stream.map(&String.to_integer(&1, 16))
    |> Enum.reduce(&bxor(&1, &2))
    |> to_hex(1)
  end
end
