class Attendance < ActiveRecord::Base

    belongs_to :user
    belongs_to :deal

    validates :deal_id, :presence => true
    validates :user_id, :presence => true
end
