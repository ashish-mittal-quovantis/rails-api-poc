class AnnouncementReceiver < ActiveRecord::Base
  belongs_to :receiver, class_name: "User", :foreign_key => 'receiver_id'
  belongs_to :appreciation, class_name: "Appreciation", :foreign_key => 'announcement_id'
  belongs_to :celebration, class_name: "Celebration", :foreign_key => 'announcement_id'
end
