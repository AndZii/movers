class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture
      t.text :description
      t.string :name
      t.string :picture_type
          
      t.timestamps null: false
    end
  end
end
