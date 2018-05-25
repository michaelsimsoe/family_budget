class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.references :family_budget, foreign_key: true

      t.timestamps
    end
  end
end
