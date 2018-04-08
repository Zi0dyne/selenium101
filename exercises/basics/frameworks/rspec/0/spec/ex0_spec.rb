

require 'rspec/expectations'


describe 'Login' do

  userName = 'Elvis'

  it 'should be correct pin' do
    expected_value = 1000
    expect(1001).to be(expected_value)
  end

  it 'should enter username' do
    expected_user_name = 'Elvis'
    expect(userName).to eq(expected_user_name)
  end

  it 'should enter password' do
    expected_password = 'Graceland'
    expect(expected_password).to eq('Graceland')
  end


end
