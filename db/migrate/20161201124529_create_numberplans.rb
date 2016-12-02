class CreateNumberplans < ActiveRecord::Migration[5.0]
  def change
    create_table :numberplans do |t|
      t.integer :prefix
      t.integer :max_length
      t.string :min_length
      t.string :integer
      t.text :usage
      t.text :comment

      t.timestamps
    end
  end
end
