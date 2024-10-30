defmodule Education.UserTest do
  use Education.DataCase

  describe "users" do
    alias Education.Comment

    import Education.BlogFixtures
    import Education.UserFixtures

  test "delete_user delete comment" do
      post = post_fixture()
      user = user_fixture()

      %Comment{user: user, post: post} |> Repo.insert!()

      assert  Repo.aggregate(Comment, :count) == 1
      user |> Repo.delete()
      assert  Repo.aggregate(Comment, :count) == 0
    end
  end
end
