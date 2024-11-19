defprotocol Lister do
  @doc "Convert input to list"
  def list_it(data)
end

defimpl Lister, for: Education.CalcRequest do
  def list_it(%Education.CalcRequest{operation: op, param1: p1, param2: p2}) do
    [op, p1, p2]
  end
end

defimpl Lister, for: BitString do
  def list_it(value) do
    String.split(value, ",")
  end
end

defimpl Lister, for: List do
  def list_it(value) do
    ["why?" | value]
  end
end

defimpl Lister, for: Tuple do
  def list_it(value) do
    Tuple.to_list(value)
  end
end

defimpl Lister, for: Atom do
  def list_it(value) do
    String.split(Atom.to_string(value), "_")
  end
end

defimpl Lister, for: Map do
  def list_it(value) do
    list = Enum.map(value, fn {k, v} ->
      [k, v]
    end)
    Enum.sort(list, &(&1 < &2))
  end
end
