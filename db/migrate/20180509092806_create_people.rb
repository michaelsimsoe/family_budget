class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.references :family_budget, foreign_key: true
      t.string :name 
      t.text :description
      t.integer :disposable_amount
      t.timestamps
    end
  end
end
