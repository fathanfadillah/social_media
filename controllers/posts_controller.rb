require_relative "../models/post.rb"

def save_post(param)
    post = Post.new(param)
    if post.extension?
        post.save(param)
    end 
end

def get_post(filter)
    post = Post.get(filter)
end 