require 'rails_helper'

RSpec.describe Category, :type => :model do
  describe "validations" do
  	let!(:category) {Category.create(name: 'Free')}

  	it "requires name" do
  		expect(category).to be_valid
  	end

  	it "has error for blank title" do
  		bad_category = Category.new
  		expect(bad_category).to have(1).errors_on(:name)
  	end

  	it "has unique title" do
  		expect(Category.create(name: 'Free')).to have(1).errors_on(:name)
  	end

  end

end
