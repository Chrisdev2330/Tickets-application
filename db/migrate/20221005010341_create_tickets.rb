class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :problem, null: false
      t.text :description, null: false
      t.integer :case, null: false
      t.integer :level, null: false
      t.integer :status, default: 0
      t.references :building, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :technical, null: false, foreign_key: true
      t.timestamps
    end
  end
end
