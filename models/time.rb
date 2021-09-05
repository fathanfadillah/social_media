class Time
    def self.yesterday
        time = now - 86400
        return time.strftime('%d %b %Y %H:%M:%S')
    end
end