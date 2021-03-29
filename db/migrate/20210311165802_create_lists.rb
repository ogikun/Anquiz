class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :about, null: false
      t.integer :public_status, null: false

      t.timestamps null: false
    end
  end
end
