class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :phone_num
      t.string :first_name
      t.string :last_name
      t.string :zip_from
      t.string :zip_to
      t.integer :reservation_number    

      t.timestamps null: false
    end
  end
end
