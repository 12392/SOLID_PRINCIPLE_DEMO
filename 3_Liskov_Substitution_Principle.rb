# Ability to replace of a parent class with an instance of one of 
# its child classes without negative side effects

# require 'date'

# class User
#     attr_accessor :settings, :email

#     def initialize(email:)
#         @email = email
#     end
# end

# class AdminUser < User
# end

# user = User.new(email: "test@gmail.com")
# user.settings = {level: "Low Security", status: "Live", signed_in: Date.today}

# admin = AdminUser.new(email: "test2@gmail.com")
# admin.settings = ["Editor", "VIP", Date.today]

# puts user.settings
# puts admin.settings

# output
# {:level=>"Low Security", :status=>"Live", :signed_in=>#<Date: 2023-03-21 ((2460025j,0s,0n),+0s,2299161j)>}
# Editor
# VIP
# 2023-03-21

# what happen if we create signed_in_today? method

# @user_database = [user , admin]

# def signed_in_today?
#     @user_database.each do |user|
#         if user.settings[:signed_in] == Date.today
#             puts "#{user.email} signed_in today"
#         end
#     end
# end

# signed_in_today?


# output --> it is giving error for admin as it array and we are defining user.settings[:signed_in] as hash
# /home/suryanshgupta/Projects/SOLID_PRINCIPLE/3_Liskov_Substitution_Principle.rb:38:in `block in signed_in_today?': no implicit conversion of Symbol into Integer (TypeError)
# 	from /home/suryanshgupta/Projects/SOLID_PRINCIPLE/3_Liskov_Substitution_Principle.rb:37:in `each'
# 	from /home/suryanshgupta/Projects/SOLID_PRINCIPLE/3_Liskov_Substitution_Principle.rb:37:in `signed_in_today?'
# 	from /home/suryanshgupta/Projects/SOLID_PRINCIPLE/3_Liskov_Substitution_Principle.rb:44:in `<main>'
# test@gmail.com signed_in today


# we can make admin hash to solve the problem but this bug can arise letter for differnt instance

# **********************SOLUTION***********************
# we will create a new functions set_settings & get_settings


require 'date'
require 'ostruct'

class User
    attr_accessor :settings, :email

    def initialize(email:)
        @email = email
    end

    def set_settings(level:, status:, signed_in:)
        @settings = OpenStruct.new(level: level, status: status, signed_in: signed_in)
    end

    def get_settings
        @settings
    end
end

class AdminUser < User
end

user = User.new(email: "test@gmail.com")
user.set_settings(level: "Low Security", status: "Live", signed_in: Date.today)

admin = AdminUser.new(email: "test2@gmail.com")
admin.set_settings(level: "EDITOR", status: "VIP", signed_in: Date.today)

@user_database = [user , admin]

def signed_in_today?
    @user_database.each do |user|
        if user.get_settings.signed_in == Date.today
            puts "#{user.email} signed_in today"
        end
    end
end

signed_in_today?

# output
# test@gmail.com signed_in today
# test2@gmail.com signed_in today