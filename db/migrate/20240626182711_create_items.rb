class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :tags
      t.string :plaintext
      t.string :image

      t.timestamps
    end
  end
end
