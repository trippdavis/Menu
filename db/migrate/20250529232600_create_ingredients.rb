class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.integer :value
      t.string :unit
      t.references :recipe, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
