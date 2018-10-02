class Request < ApplicationRecord
  belongs_to :home
  belongs_to :owner, :class_name =>'user', :foreign_key => 'owner_id'
  belongs_to :sender,  :class_name =>'user', :foreign_key => 'sender_id'
end
