require_relative "../function/extract_word.rb"
require_relative  "../function/remove_duplicate.rb"
require_relative "../database/db_connector.rb"
require_relative "./time.rb"

class Tag
    attr_reader :updated_at, :created_at,:tag, :id

    def initialize(params)
        @tag = params["tag"]
        @created_at = params["created_at"]
        @updated_at = params["updated_at"]
    end

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
    
    def self.all    
        time = Time.yesterday
        client = create_db_client
        result = client.query("SELECT * FROM tags WHERE created_at >= '#{time}' GROUP BY tag ORDER BY created_at DESC LIMIT 5")
        convert_sql_result_to_array(result)
    end

    def self.save(params)
        tags = findTags(params)
        tags = remove_duplicate(tags)
        today = Time.now
        client = create_db_client
        tags.each do |tag|
            client.query("INSERT INTO tags (tag, created_at) values('#{tag}', '#{today}')")
        end 
    end
    
    def self.convert_sql_result_to_array(result)
        tags = Array.new
        
        result.each do |data|
            rawData = Tag.new(data) 
            tags.push(rawData) 
        end
        
        tags
    end
end