defprotocol Lister do
  @doc "Convert input to list"
  def list_it(data)
end

defimpl Lister, for: Education.CalcRequest do
  def list_it(%Education.CalcRequest{operation: op, param1: p1, param2: p2}) do
    [op, p1, p2]
  end
end
