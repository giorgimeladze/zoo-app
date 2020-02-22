class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :specie
      t.integer :age
      t.string :color
      t.string :sex
      t.integer :quantity

      t.timestamps
    end
  end
end
