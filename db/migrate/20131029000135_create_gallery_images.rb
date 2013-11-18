class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :caption
      t.text :description
      t.belongs_to :project
      t.attachment :image
      t.timestamps
    end
    add_index :gallery_images, :project_id
  end
end
