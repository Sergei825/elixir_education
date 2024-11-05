defmodule Protocol.ListerTest do
  use ExUnit.Case

  describe "lister" do
    test "ok for BitString conversion" do
      assert ["16", "12"] = Lister.list_it("16,12")
    end

    test "ok for List conversion" do
      assert ["why?", 16, 12] = Lister.list_it([16, 12])
    end

    test "ok for Tuple conversion" do
      assert ["some", 3, 6] = Lister.list_it({"some", 3, 6})
    end

    test "ok for Atom conversion" do
      assert ["atom", "2"] = Lister.list_it(:atom_2)
    end

    test "ok for Map conversion" do
      assert [[:a, 1], [:b, 2]] = Lister.list_it(%{a: 1, b: 2})
    end
  end
end
