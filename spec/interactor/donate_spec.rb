require 'rails_helper'

RSpec.describe Donate, type: :model do
  it 'raises an error when the receiver does not exist' do
    expect { described_class.new.call('nope', 123) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
