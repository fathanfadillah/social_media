require_relative "../models/comment.rb"

def save_comment(param)
    comment = Comment.new(param)
    comment.save
end 