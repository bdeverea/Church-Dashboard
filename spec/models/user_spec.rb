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

  it 'requires an email address' do
    user1 = User.new(email: "")
    user2 = User.new(email: "bob@email.com")

    user1.valid?
    user2.valid?

    expect(user1.errors[:email].any?).to eq(true)
    expect(user2.errors[:email].any?).to eq(false)
  end

  it 'accepts a correctly formatted email address' do
    emails = %w[bob@email.com bob.builder@test.email.com bbuilder@email.com]
    emails.each do | email |
      user = User.new(user_attributes(email: email))
      user.valid?
      expect(user.errors[:email].any?).to eq(false)
    end
  end

  it 'rejects an incorrectly formatted email address' do
    emails = %w[@ bob@ bbuilder @email.com]
    emails.each do | email |
      user = User.new(user_attributes(email: email))
      user.valid?
      expect(user.errors[:email].any?).to eq(true)
    end
  end

  it 'requires a unique email address' do
    user1 = User.create!(user_attributes)
    user2 = User.new(user_attributes(email: user1.email))

    user2.valid?

    expect(user2.errors[:email].first).to eq("has already been taken")
  end

  it 'requires a password when created' do 
    user1 = User.new(user_attributes(password: ''))
    user2 = User.new(user_attributes)

    user1.valid?
    user2.valid?

    expect(user1.errors[:password].any?).to eq(true)
    expect(user2.errors[:password].any?).to eq(false)
  end

end
