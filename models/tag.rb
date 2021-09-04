require_relative "../database/db_connector.rb"
require_relative "../function/extract_word.rb"

class Tag
    def self.findTags(params)
        tags = extract_word(params)
        word = []
        tags.each do |tag|
            if tag.include? "#"
                word.push(tag) 
            end 
        end
        tags = word
        return tags 
    end
    
    def all
    end
    
    def get(params)
    end 

    def self.save(params)
        tags = findTags(params)
        client = create_db_client
        tags.each do |tag|
            client.query("INSERT INTO tags (tag) values('#{tag}')")
        end 
    end 
end 

input = "user can see the list #of trending #hashtags."
Tag.save(input)