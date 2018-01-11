class User < ActiveRecord::Base
  include HasManyFollowers


  has_many :active_relationships,
    class_name: "Relationship",
    foreign_key: :follower_id,
    dependent: :destroy

  FOLLOWABLES = {
    user: "User",
    post: "Post"
  }

  has_many :following_users, through: :active_relationships,
            source: "following", source_type: FOLLOWABLES[:user]

  has_many :following_posts, through: :active_relationships,
            source: "following", source_type: FOLLOWABLES[:post]

  SOURCE_TYPES = %w[Post, User]

  has_many :posts, dependent: :nullify

  def follow(target)
    if target.class.name.in?(FOLLOWABLES.values) && target.persisted?
      Relationship.find_or_create_by!(follower: self, following: target)
    end
  end
end
