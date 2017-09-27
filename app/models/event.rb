class Event < ActiveRecord::Base
  # attr_accessible :eventtable_body, :eventtable_id, :eventtable_type, :user_id

  belongs_to :eventtable, :polymorphic => true
  belongs_to :user, :dependent => :destroy

  EVENT = %w{Navigation User Comment Like}
  validates :eventtable_type, :presence => true, :inclusion => {:in => EVENT}


end
