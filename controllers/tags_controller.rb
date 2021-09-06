require_relative "../models/tag.rb"

def get_all_tag
    tags = Tag.all
    return tags
end

