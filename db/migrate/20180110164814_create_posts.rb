class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content

      t.timestamps          null: false
    end

    add_reference   :posts, :author, references: :users, index: true, null: false
    add_foreign_key :posts, :users, column: :author_id
  end
end
