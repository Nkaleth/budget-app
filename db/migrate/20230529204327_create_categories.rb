class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.references :author_id, null: false, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
