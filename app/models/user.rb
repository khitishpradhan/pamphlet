class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_one_attached :avatar

  after_commit :add_default_avatar, on: %i[create update]

  # restrict only some attributes to be exported

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "/default_profile.jpeg"
    end
  end

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            "app", "assets", "images", "default_profile.jpeg"
          )
        ),
        filename: "default_profile.jpeg",
        content_type: "image/jpeg",

      )
    end
  end
end
