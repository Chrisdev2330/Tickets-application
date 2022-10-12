class CreateTechnicals < ActiveRecord::Migration[7.0]
  def change
    create_table :technicals do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :phone, null: false
      t.string :address, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
