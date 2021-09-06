require_relative "../database/db_connector.rb"
require_relative "../function/get_extension.rb"
require_relative "../models/time.rb"

class Post
    def initialize(params)
      @user_id = params["user_id"]
      @file = params["file"]
      @text = params["text"]
    end

    def save(params)
        today = Time.now
        client = create_db_client
        result = client.query("INSERT INTO posts (user_id, file, text, created_at) 
                              values('#{@user_id}','#{@file}','#{@text}','#{today}')")
    end
    
    def extension?
      extension = get_extension(@file)

      if extension == "jpg" || extension == "png" || extension == "gif" || extension == "mp4"
        true
      else
        false
      end
    end 
end