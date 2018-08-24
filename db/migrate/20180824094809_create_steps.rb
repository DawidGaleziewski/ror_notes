class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.integer :position
      t.string :title
      t.text :description
      t.string :category
      
    end
  end
end
