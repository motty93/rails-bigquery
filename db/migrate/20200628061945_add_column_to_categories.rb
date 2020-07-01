class AddColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :synchronized, :boolean, default: false, null: false
  end
end
