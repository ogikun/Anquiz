class CreateAddWords < ActiveRecord::Migration[5.2]
  def change
    create_table :add_words do |t|
      t.integer :list_id, null: false
      t.integer :word_id, null: false

      t.timestamps
    end
  end
end
