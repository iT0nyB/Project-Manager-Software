class Milestone < ActiveRecord::Base
    belongs_to :project, :foreign_key => "project_id"
    validates_presence_of :project_id
end
