class Post
    def initialize(params)
      @file = params["file"]
      @text = params["text"]
    end

    def save(params)
        client = create_db_client
        result = client.query("INSERT INTO users (file, text) values('#{@file}','#{@text}')")
    end 
end 