class ChangeColumnsNotnullAddFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    change_column_null :follow_relationships, :follower_id, false
    change_column_null :follow_relationships, :followed_id, false
  end
end
