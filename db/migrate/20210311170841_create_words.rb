class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.references :user, null: false, foreign_key: true
      t.string :question, null: false
      t.string :answer, null: false
      t.text :description, null: false
      t.integer :public_status, null: false

      t.timestamps
    end
  end
end
