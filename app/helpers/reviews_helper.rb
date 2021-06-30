module ReviewsHelper
  def find_user(id)
    user = User.select("name").where(id: id).first

    return user.name
  end
end
