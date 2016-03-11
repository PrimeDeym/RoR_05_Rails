class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :title
      t.text :text
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :petitions, [:user_id, :created_at]
  end
end
