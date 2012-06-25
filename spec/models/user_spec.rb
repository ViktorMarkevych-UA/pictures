require 'spec_helper'

  describe User do

    subject { Factory :user }
    it { should have_many :pictures  }
    it { should have_many :comments  }
    it { should have_many :events  }

    before(:each) do
      @user = Factory :user
    end

    it "should create a new user with state new" do
      newuser = User.new
      newuser.new_record?.should be_true
    end

    it "Create valid user" do
      assert(@user.valid?)
    end

    it "Should set unique email" do
      user1 = Factory(:user, :email => "a@b.com")
      user2 = Factory.build(:user, :email => "a@b.com")
      assert(@user.valid?) and assert(!user2.valid?)
    end

  context "after_create" do
      context "create_use" do
        it "should create event after user is created" do
          Event.destroy_all
          Event.all.count.should eq 0
          3.times{Factory :user}
          Event.all.count.should eq 3
        end
      end
    end
  end
