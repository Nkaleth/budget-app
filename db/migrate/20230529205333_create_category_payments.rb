class CreateCategoryPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :category_payments do |t|

      t.timestamps
    end
  end
end
