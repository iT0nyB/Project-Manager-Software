class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :proMgrId
      t.decimal :budget
      t.decimal :ongoingcost
      t.string :location

      t.timestamps null: false
    end
  end
end
