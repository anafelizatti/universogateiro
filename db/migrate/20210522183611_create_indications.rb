class CreateIndications < ActiveRecord::Migration[6.1]
  def change
    create_table :indications do |t|
      t.string :category
      t.string :name
      t.text :description
      t.float :price
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
