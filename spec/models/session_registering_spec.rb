require 'rails_helper'

describe SessionRegistering do
  it 'initializes with a parent, child, and a session' do
    child = build(:child)
    session = build(:play_session)
    expect {
      described_class.new(child.id, session.id)
    }.to_not raise_error
  end

  context 'when performing the registration' do
    it 'assigns a child to a session' do
      child = create(:child)
      session = create(:play_session)

      SessionRegistering.call(child.id, session.id)

      expect(session.users).to include(child)
    end
    it 'processes the parents payment'
    it 'notfies the parent of a confirmed registration'
  end

end
