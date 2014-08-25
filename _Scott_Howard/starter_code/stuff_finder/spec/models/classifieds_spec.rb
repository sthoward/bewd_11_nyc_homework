require 'rails_helper'

RSpec.describe Classified, :type => :model do
  describe "validations" do
    let!(:classified) {Classified.create(title: 'Test')}

    it "requires title" do
      expect(classified).to be_valid
    end

    it "has error for blank title" do
      bad_classified = Classified.new
      expect(bad_classified).to have(1).errors_on(:title)
    end

    it "has unique title" do
      expect(Classified.create(title: 'Test')).to have(1).errors_on(:title)
    end
  end

  context "With user" do
    let(:user) {User.create(email: 'bla@bla.com')}

    it "belongs to a user" do
      c = Classified.create(title: "Test")
      c.user = user
      c.save
      expect(c).to be_valid
    end


  end

  context "With a category" do

    it "has a category"
    
  end
end
