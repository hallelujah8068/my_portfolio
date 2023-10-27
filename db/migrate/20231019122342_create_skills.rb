class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :skill
      t.integer :learning_time
      t.integer :category
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
