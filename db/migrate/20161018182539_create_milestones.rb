class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.date :startDate
      t.date :completionDate
      t.string :state

      t.timestamps null: false
    end
  end
end
