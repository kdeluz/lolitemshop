class CreateGolds < ActiveRecord::Migration[7.1]
  def change
    create_table :golds do |t|
      t.integer :total
      t.integer :base
      t.integer :sell
      t.boolean :purchasable
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
