require 'spec_helper'

describe Picture do


  it "should be created picture" do
    pic = Picture.new
    pic.new_record?.should be_true
  end

  it "Should have reflections" do
    Picture.reflect_on_association(:category).macro.should == :belongs_to
    Picture.reflect_on_association(:comments).macro.should == :has_many
    Picture.reflect_on_association(:users).macro.should == :has_many
    Picture.reflect_on_association(:likes).macro.should == :has_many
  end
end
