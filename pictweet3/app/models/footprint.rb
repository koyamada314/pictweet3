class Footprint < ActiveRecord::Base

  belongs_to :visitor, class_name: "User", foreign_key: "visitor_id"
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  
end
