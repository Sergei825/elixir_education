defmodule Education.UserTest do
  use Education.DataCase

  alias Education.User

  describe "users" do
    alias Education.User
    alias Education.Blog

    import Education.BlogFixtures
    import Education.UserFixtures
    import Education.CommentFixtures

    test "delete_post/1 deletes the user and posts" do
      post = post_fixture()
      user = user_fixture()
      comment_fixture(user_id: user.id, post_id: post.id)

      assert {:ok, %User{}} = Education.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end
  end
end
