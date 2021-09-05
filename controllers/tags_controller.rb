require_relative "../models/tag.rb"

def get_all_tag
    tags = Tag.all
    puts tags
end