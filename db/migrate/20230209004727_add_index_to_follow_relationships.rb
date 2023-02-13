class AddIndexToFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    add_index :follow_relationships, :follower_id
    add_index :follow_relationships, :followed_id
    add_index :follow_relationships, %i[follower_id followed_id], unique: true
  end
end
