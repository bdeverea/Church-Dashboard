require 'spec_helper'

describe User do
  
  it 'is valid with example attributes' do
    user1 = User.new(user_attributes)

    expect(user1.valid?).to eq(true)

  end

  it 'requires a first and last name' do
    user1 = User.new(first_name: "", last_name: "")
    user2 = User.new(first_name: "Bob", last_name: "Builder")

    user1.valid?
    user2.valid?

    expect(user1.errors[:first_name].any?).to eq(true)
    expect(user2.errors[:first_name].any?).to eq(false)
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

  it 'requires a password' do 
    user1 = User.new(user_attributes(password: ''))
    user2 = User.new(user_attributes)

    user1.valid?
    user2.valid?

    expect(user1.errors[:password].any?).to eq(true)
    expect(user2.errors[:password].any?).to eq(false)
  end

  it 'requires a password greater than 8 characters' do
    user1 = User.new(user_attributes(password: '1234567'))

    user1.valid?

    expect(user1.errors[:password].any?).to eq(true)
  end

  it 'requires a password confirmation when a password is present' do
    user1 = User.new(user_attributes(password_confirmation: ""))

    user1.valid?

    expect(user1.errors[:password_confirmation].any?).to be(true)
  end

  it 'requires a password confirmation to match the password' do
    user1 = User.new(user_attributes(password_confirmation: "NoMatch"))

    user1.valid?

    expect(user1.errors[:password_confirmation].first).to eq("doesn't match Password")
  end

  it 'requires a password and matching password confirmation on create' do
    user1 = User.create!(user_attributes)

    expect(user1.valid?).to eq(true)
  end

  it 'does not require a password and matching password confirmation on update' do
    user1 = User.create!(user_attributes)
    
    user1.password = ""

    expect(user1.valid?).to eq(true)
  end

  it 'automatically encrypts the password into the password_digest' do
    user1 = User.new(user_attributes)

    expect(user1.password_digest.present?).to be(true)
  end

  it 'returns a formatted name' do
    user1 = User.new(user_attributes)

    expect(user1.name).to eq(user1.last_name + ', ' + user1.first_name)
  end


end
