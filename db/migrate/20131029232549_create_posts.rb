class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :published_at
      t.belongs_to :user
      t.string :seo_title
      t.string :seo_description

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
