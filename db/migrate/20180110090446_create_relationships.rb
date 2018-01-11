class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships, id: false do |t|
      t.references :following, polymorphic: true, index: true

      t.timestamps              null: false
    end

    add_reference   :relationships, :follower, references: :users
    add_foreign_key :relationships, :users, column: :follower_id

    add_index(:relationships, [:follower_id, :following_id, :following_type], unique: true, using: :btree, name: 'index_relationships_on_follower_and_following')
  end
end
