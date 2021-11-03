require './spec/rails_helper.rb'

RSpec.describe User do
  subject { described_class.new(:email => email, :password => password) }
  let(:email) { "test@example.com" }
  let(:password) { "password1" }

  it "is valid" do
    expect(subject).to be_valid
  end

  
end