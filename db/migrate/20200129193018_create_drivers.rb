class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :last_name
      t.string :code

      t.timestamps
    end
  end
end
