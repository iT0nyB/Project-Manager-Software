class RemoveProMgrIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :proMgrId, :string
  end
end
