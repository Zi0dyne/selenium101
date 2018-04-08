

require 'rspec/expectations'


describe 'Login' do

  before(:all) do
    puts "[before]: all"

    @userName = 'Elvis'
    @city = 'Memphis, TN'
  end

  after(:all) do
    puts "[after]: all"
  end


  describe 'with Valid Credentials' do

    it 'should be correct pin' do
      expected_value = 1001
      expect(1001).to be(expected_value)
    end

    it 'should enter username' do
      expected_user_name = 'Elvis'
      expect(@userName).to eq(expected_user_name)
    end


  end



end