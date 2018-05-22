class RemoveDisposableAmountFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_column :people, :disposable_amount, :integer
  end
end
