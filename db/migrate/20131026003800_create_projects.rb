class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url
      t.datetime :completed_at
      t.datetime :published_at
      t.text :stats
      t.belongs_to :user

      t.timestamps
    end
    add_index :projects, :user_id
  end
end
