class AddIndexPrefixToNumberplan < ActiveRecord::Migration[5.0]
  def change
    add_index :numberplans, :prefix
  end
end
