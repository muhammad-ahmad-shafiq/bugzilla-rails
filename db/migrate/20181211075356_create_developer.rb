class CreateDeveloper < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :name
      t.date :date_of_birth
      t.string :address
      t.string :designation
      t.timestamps
    end
  end
end
