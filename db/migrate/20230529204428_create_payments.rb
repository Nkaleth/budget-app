class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :author_id, null: false, foreign_key: { to_table: :users }, index: true
      t.string :name, null: false
      t.float :amount, null: false
      t.timestamps
    end
  end
end
