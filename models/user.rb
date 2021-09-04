require_relative "../database/db_connector.rb"

class User
    attr_reader  :bio, :email, :name

    def initialize(params)
        @username = params["username"]
        @email = params["email"]
        @bio = params["bio"]
    end

    def self.all
        client = create_db_client
        result = client.query("SELECT * FROM users")
        convert_sql_result_to_array(result)
    end

    def save
        client = create_db_client
        result = client.query("INSERT INTO users (username, email, bio) values('#{@username}','#{@email}','#{@bio}')")
    end 
        
    def self.convert_sql_result_to_array(result)
        users = Array.new
        result.each do |data|
            rawData = User.new(data) 
            users.push(rawData) 
        end
        users
    end
end

