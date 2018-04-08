

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

    before(:each) do
      puts "[before]: each"
    end

    it 'should be correct integer' do
      expected_value = 1001
      expect(1001).to be(expected_value)
    end

    it 'should enter username' do
      expected_user_name = 'Elvis'
      expect(@userName).to eq(expected_user_name)
    end


    describe 'Birth date' do

      before(:each) do
        puts "before.each - Birthdate"
      end

      it 'should be correct city' do
        expect(@city).to match(/^Memph.*/)
      end

      it 'should be correct street' do
        expect('Elvis Presley Blvd, Memphis, TN').to include('Presley Blvd')
      end

    end



  end



end