def extract_word(character)
    word = ""
    tags = []
    for i in 0..character.length-1
        if character[i] == " "
            tags.push(word) 
            word = ""
        elsif i == character.length-1
            word += character[i]
            tags.push(word)    
        else
            word += character[i]  
        end               
    end
    return tags
end