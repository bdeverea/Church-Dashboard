class AddFirstAndLastNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    if split_name_into_first_last
      remove_column :users, :name
    end
  end

  def down
    if add_column :users, :name, :string
      if combine_names
        remove_column :users, :last_name
        remove_column :users, :first_name
      end
    end
  end

private
  def split_name_into_first_last
    print "Parsing User names into first/last fields \n\n"

    users = User.all

    users.each do |user|
      names = user.name.split(' ')

      print "# parsing user: #{names} \n\n"

      user.first_name = names[0]
      user.last_name = names[1]
      
      begin 
        user.save
        print "## #{user.name} successfully parsed and saved \n\n"
      rescue Exception => e 
        print "### #{e} \n"
        print "### An error occurred. #{user.name} not saved \n\n"
      end
    end
  end

  def combine_names
    users = User.all

    users.each do |user|
      user.name = user.first_name + " " + user.last_name
      user.save
    end
  end

end
