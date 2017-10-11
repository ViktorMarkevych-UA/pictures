require 'spec_helper'

describe Event do

  subject { Factory :events }
    it { should belong_to :user  }
    it { should belong_to :eventtable  }

  #before(:each) do
  #  @event = Factory :event
  #end

  it "Should be validates eventtable_type" do
      Event::EVENT.each do |e|
      eve = Factory :events, :eventtable_type => e
      assert(eve.valid?)
    end
  end

  it "Should be invalid eventtable_type" do
    event = ["Navigation1", "User1", "Comment1", "Like1"]
    event.each do |e|
      eve2 = Factory.build :events, :eventtable_type => e
      #assert_equal(!eve2.valid?, false)
      !eve2.errors.entries.select{|k| k.first == "eventtable_type"}.empty?
      !eve2.valid?
    end
  end
end
