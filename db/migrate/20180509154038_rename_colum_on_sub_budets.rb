class RenameColumOnSubBudets < ActiveRecord::Migration[5.2]
  def change
  	rename_column :sub_budget_notations, :type, :notation_type
  	rename_column :person_budget_notations, :type, :notation_type
  end
end
