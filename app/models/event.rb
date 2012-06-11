class Event < ActiveRecord::Base
  attr_accessible :eventtable_body, :eventtable_id, :eventtable_type

  belongs_to :event, :polymorphic => true

  EVENT=%w{User Comment Like}
  validates :eventtable_type, :presence => true, :inclusion => {:in => EVENT}

end
