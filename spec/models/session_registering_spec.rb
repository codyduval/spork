require 'rails_helper'

describe SessionRegistering do
  it 'initializes with a parent, child, and a session' do
    parent = build(:user)
    child = build(:child)
    session = build(:play_session)
    expect {
      described_class.new(parent.id, child.id, session.id)
    }.to_not raise_error
  end

  context 'when performing the registration' do
    it 'assigns a child to a session' do
      parent = create(:user)
      child = create(:child)
      session = create(:play_session)

      reg = SessionRegistering.new(parent.id, child.id, session.id)
      session = reg.execute

      expect(session.users).to include(child)
    end
    it 'processes the parents payment'
    it 'notfies the parent of a confirmed registration'
  end

end
