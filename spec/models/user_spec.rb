require 'spec_helper'

describe User do
  it "Create valid user" do
    @obj = FactoryGirl.create(:user)
    assert(@obj.valid?)
  end

  it "Should set unique email" do
    obj = FactoryGirl.create(:user, :email => "a@b.com")
    obj2 = FactoryGirl.build(:user, :email => "a@b.com")
    assert(obj.valid?) and assert(!obj2.valid?)
  end
  it "Should have reflections" do
    User.reflect_on_association(:pictures).macro.should == :has_many
    User.reflect_on_association(:comments).macro.should == :has_many
    User.reflect_on_association(:events).macro.should == :has_many
  end

  context "after_create" do
    context "create_use" do
      it "should create event after user is created" do
        Event.all.count.should eq 0
        3.times{FactoryGirl.create(:user)}
        Event.all.count.should eq 3
      end
    end
  end



end
    #it "Create invalid user" do
    #  @obj = User.create
    #  assert(!@obj.valid?)
    #end

    #it "Should have reflections" do
    #  User.reflect_on_association(:social_registrations).macro.should == :has_many
    #  User.reflect_on_association(:invoices).macro.should == :has_many
    #  User.reflect_on_association(:withdrawals).macro.should == :has_many
    #  User.reflect_on_association(:domains).macro.should == :has_many
    #  User.reflect_on_association(:subaccounts).macro.should == :has_many
    #  User.reflect_on_association(:parent).macro.should == :belongs_to
    #  User.reflect_on_association(:binds).macro.should == :has_many
    #
    #  g = User.reflect_on_association(:services)
    #  g.macro.should == :has_many
    #  g.options[:through].should eql :binds
    #
    #  User.reflect_on_association(:activities).macro.should == :has_many


    #  User.reflect_on_association(:bookmarks).macro.should == :has_many
    #
    #  g = User.reflect_on_association(:bookmarked)
    #  g.macro.should == :has_many
    #  g.options[:through].should eql :bookmarks
    #  g.options[:source].should eql :activity
    #
    #  User.reflect_on_association(:comments).macro.should == :has_many
    #  User.reflect_on_association(:likes).macro.should == :has_many
    #
    #  User.reflect_on_association(:notifications).macro.should == :has_many
    #  User.reflect_on_association(:notifications).macro.should == :has_many
    #  User.reflect_on_association(:tokens).macro.should == :has_many
    #
    #  g = User.reflect_on_association(:api_clients)
    #  g.macro.should == :has_many
    #  g.options[:through].should eql :tokens
    #
    #  User.reflect_on_association(:images).macro.should == :has_many
    #  User.reflect_on_association(:pics).macro.should == :has_many
    #  User.reflect_on_association(:claims).macro.should == :has_many
    #  User.reflect_on_association(:followings).macro.should == :has_many
    #
    #  g = User.reflect_on_association(:followers)
    #  g.macro.should == :has_many
    #  g.options[:through].should eql :followings
    #
    #  User.reflect_on_association(:works).macro.should == :has_many
    #  User.reflect_on_association(:institutions).macro.should == :has_many
    #end


  #context 'validations' do
  #  context 'validation of presence' do
  #    it "Should set full_name" do
  #      obj = FactoryGirl.build(:user, :full_name => nil)
  #      assert(!obj.valid?)
  #    end
  #
  #    it "Should set email" do
  #      obj = FactoryGirl.build(:user, :email => nil)
  #      assert(!obj.valid?)
  #    end
  #
  #    it "Should set password" do
  #      obj = FactoryGirl.build(:user, :password => nil)
  #      assert(!obj.valid?)
  #    end
  #  end
  #  context 'validation of ..' do
  #    it "Should set unique email" do
  #      obj = FactoryGirl.create(:user, :email => "a@b.com")
  #      obj2 = FactoryGirl.build(:user, :email => "a@b.com")
  #      assert(obj.valid?) and assert(!obj2.valid?)
  #    end
  #
  #    it "Should set valid email" do
  #      obj = FactoryGirl.build(:user, :email => "ab.com")
  #      obj2 = FactoryGirl.build(:user, :email => "a@b")
  #      assert(!obj.valid?) and assert(!obj2.valid?)
  #    end
  #  end
#end