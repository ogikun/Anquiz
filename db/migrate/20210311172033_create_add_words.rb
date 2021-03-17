class CreateAddWords < ActiveRecord::Migration[5.2]
  def change
    create_table :add_words do |t|
      t.references :list, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true

      t.timestamps
    end
  end
end
