class Event < ActiveRecord::Base
  attr_accessible :event_id, :event_type, :string

  belongs_to :eventtable, :polymorphic => true

  EVENT=%w{User Comment Like}
  validates :event_type, :presence => true, :inclusion => {:in => EVENT}

end
