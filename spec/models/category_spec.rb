require 'spec_helper'

describe Category do

  it "Should have reflections" do
    Category.reflect_on_association(:pictures).macro.should == :has_many
  end
end
