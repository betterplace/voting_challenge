require 'rails_helper'

RSpec.describe Receiver, type: :model do
  it 'is valid if it has a name' do
    expect(Receiver.new).not_to be_valid
    expect(Receiver.new(name: 'Bob')).to be_valid
  end
end
