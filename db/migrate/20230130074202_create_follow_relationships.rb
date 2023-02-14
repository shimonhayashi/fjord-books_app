class CreateFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end

    add_foreign_key :follow_relationships, :users, column: :follower_id
    add_foreign_key :follow_relationships, :users, column: :followed_id
    add_index :follow_relationships, :follower_id
    add_index :follow_relationships, :followed_id
    add_index :follow_relationships, %i[follower_id followed_id], unique: true
  end
end
