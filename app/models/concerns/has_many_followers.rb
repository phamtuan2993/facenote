module HasManyFollowers
  extend ActiveSupport::Concern

  included do
    has_many :passive_relationships,
              class_name: "Relationship",
              as: :following,
              dependent: :destroy

    has_many :followers, through: :passive_relationships
  end
end
