class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :school_id
      t.boolean :principal, default: false

      t.timestamps
    end
  end
end
