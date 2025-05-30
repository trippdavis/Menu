class CreateInstructions < ActiveRecord::Migration[8.0]
  def change
    create_table :instructions do |t|
      t.integer :step
      t.references :recipe, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
