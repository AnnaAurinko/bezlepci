class RemoveCommentIdFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :comment_id
  end
end
