class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.integer :user_id, null: false
      t.string :question, null: false
      t.string :answer, null: false
      t.text :description, null: false
      t.integer :public_status, null: false

      t.timestamps
    end
  end
end
