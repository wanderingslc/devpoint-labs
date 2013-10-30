class RenameGalleryImagesTableToPicturesAndMakeItPolymorphicAndRemoveReferenceToProjectId < ActiveRecord::Migration
  def up
    rename_table :gallery_images, :pictures
    change_table :pictures do |t|
      t.references :pictureable, polymorphic: true
    end
    add_index :pictures, :pictureable_id
    Picture.attr_accessible :pictureable_id, :pictureable_type
    Picture.all.each do |picture|
      if picture.project_id.present?
        picture.update_attributes(pictureable_id: picture.project_id, pictureable_type: 'Project')
      end
    end
    remove_column :pictures, :project_id
  end

  def down
    add_column :pictures, :project_id, :integer
    Picture.attr_accessible :project_id
    Picture.all.each do |picture|
      if picture.pictureable_id.present? && picture.pictureable_type == 'Project'
        picture.update_attributes(project_id: picture.pictureable_id)
      end
    end
    remove_column :pictures, :pictureable_id
    remove_column :pictures, :pictureable_type
    rename_table :pictures, :gallery_images
  end
end
