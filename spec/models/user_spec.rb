require 'spec_helper'

describe User do
  
  it 'requires a name' do
    user1 = User.new(name: "")
    user2 = User.new(name: "Bob")

    user1.valid?
    user2.valid?

    expect(user1.errors[:name].any?).to eq(true)
    expect(user2.errors[:name].any?).to eq(false)
  end

end
