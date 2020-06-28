class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :gen_id
      t.string :bg_color
      t.string :border_color

      t.timestamps
    end
  end
end
