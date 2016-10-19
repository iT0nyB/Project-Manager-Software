class Project < ActiveRecord::Base
    belongs_to :user
    has_many :milestones, dependent: :destroy
    validates_presence_of :title
end
