class CreateMemberRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :member_requests do |t|
      t.references :family_budget, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
