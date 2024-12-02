require 'rails_helper'

RSpec.describe Donation, type: :model do
  it 'is valid with all necessary data' do
    receiver = Receiver.new(name: "Best Corp")

    expect(Donation.new(amount_in_cents: 123, receiver:)).to be_valid
  end

  context "state transitions" do
    let(:receiver) { Receiver.create(name: "Best Corp") }
    let(:amount_in_cents) { 500 }


    context "from created" do
      let(:donation) { Donation.create(amount_in_cents:, receiver:) }

      it 'can transition to confirmed' do
        expect { donation.confirm }.to change { donation.aasm_state }.from('created').to('confirmed')
      end

      it 'can transition to failed' do
        expect { donation.fail }.to change { donation.aasm_state }.from('created').to('failed')
      end

      it 'cannot transition to revoked' do
        expect { donation.revoke }.to raise_error(AASM::InvalidTransition)
      end
    end

    context "from confirmed" do
      let(:donation) { Donation.create(aasm_state: :confirmed, amount_in_cents:, receiver:) }

      it 'can transition to revoked' do
        expect { donation.revoke }.to change { donation.aasm_state }.from('confirmed').to('revoked')
      end

      it 'cannot transition to failed' do
        expect { donation.fail    }.to raise_error(AASM::InvalidTransition)
        expect { donation.confirm }.to raise_error(AASM::InvalidTransition)
      end
    end

    context "from revoked" do
      let(:donation) { Donation.create(aasm_state: :revoked, amount_in_cents:, receiver:) }

      it 'cannot transition to other states' do
        expect { donation.fail    }.to raise_error(AASM::InvalidTransition)
        expect { donation.revoke  }.to raise_error(AASM::InvalidTransition)
        expect { donation.confirm }.to raise_error(AASM::InvalidTransition)
      end
    end

    context "from failed" do
      let(:donation) { Donation.create(aasm_state: :failed, amount_in_cents:, receiver:) }

      it 'cannot transition to other states' do
        expect { donation.fail    }.to raise_error(AASM::InvalidTransition)
        expect { donation.revoke  }.to raise_error(AASM::InvalidTransition)
        expect { donation.confirm }.to raise_error(AASM::InvalidTransition)
      end
    end
  end
end
