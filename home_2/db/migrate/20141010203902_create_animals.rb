class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :first_name

      t.timestamps
    end
  end
end
