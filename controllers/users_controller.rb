require_relative "../models/user.rb"

def save_user(param)
    user = User.new(param)
    user.save
end 