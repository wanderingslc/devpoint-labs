class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :taggable, polymorphic: true

      t.timestamps
    end
    add_index :tags, :taggable_id
  end
end
