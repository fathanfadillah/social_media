require_relative "../database/db_connector.rb"
require_relative "../function/extract_word.rb"

class Tag
    def self.findTags(params)
        
    end
    
    def all
    end
    
    def get(params)
    end 

    def self.save(params)
        tags = findTags(params)
        client = create_db_client
        tags.each do |tag|
            puts tag
            client.query("INSERT INTO tags (tag) values('#{@username}','#{@email}','#{@bio}')")
        end 
    end 
end 

input = "user can see the list #of trending #hashtags."
Tag.save(input)