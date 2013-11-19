class RemoveUnusedAvatarFieldsFromUser < ActiveRecord::Migration
  def up
    drop_attached_file :users, :avatar

  end

  def down
    change_table :users do |t|
      t.attachment :avatar
      # For reference
      # t.string   "avatar_file_name"
      # t.string   "avatar_content_type"
      # t.integer  "avatar_file_size"
      # t.datetime "avatar_updated_at"
    end
  end
end
