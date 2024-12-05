require 'rails_helper'

RSpec.describe Donate, type: :model do
  it 'raises an error when the receiver does not exist' do
    result = described_class.new.call('nope receiver', 123)

    expect(result.donation).to be_present
    expect(result.donation).not_to be_persisted
    expect(result.success).to be_falsey
  end
end
