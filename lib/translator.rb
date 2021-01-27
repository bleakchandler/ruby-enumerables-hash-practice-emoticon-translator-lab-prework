# require modules here


require "pry"
require "yaml"


def load_library(path)
 path = YAML.load_file("lib/emoticons.yml")
  updated_emoticon_library = {}
     path.each do |emoji_name, emoji|
      updated_emoticon_library[emoji_name] = {:english => {}, :japanese => {}}
       emoji.each_with_index do |emojinew|
        if updated_emoticon_library[emoji_name][:english] == {}
            updated_emoticon_library[emoji_name][:english] = emojinew
        else
            updated_emoticon_library[emoji_name][:japanese] = emojinew
       end
     end
   end
  # p "#{updated_emoticon_library}"
  updated_emoticon_library
end




#alternate correct method:
 #def load_library(path)
 #path = YAML.load_file("lib/emoticons.yml")
  #updated_emoticon_library = {}
  #   path.each do |emoji_name, emoji|
   #   updated_emoticon_library[emoji_name] = {:english => {}, :japanese => {}}
  #     emoji.each_with_index do |emojinew, index|
   #     if index == 0
#            updated_emoticon_library[emoji_name][:english] = emojinew
 #       else
  #          updated_emoticon_library[emoji_name][:japanese] = emojinew
   #    end
 #    end
  # end
  # p "#{updated_emoticon_library}"
#  updated_emoticon_library
#end




def get_japanese_emoticon(path, emoticon)
   get_emoticons = load_library(path)
   meaning = ""
  
  get_emoticons.each do |key, value|
    if emoticon == value[:english]
      return meaning = key
    else
      meaning = "Sorry, that emoticon was not found"
    end
  end
    meaning
end

def get_english_meaning(path, emoticon)
  get_emoticons = load_library(path)
  
 
  get_emoticons.each do |key, value|
    if emoticon == value[:japanese]
      return key
    #  p key
    else
       answer = ""
       answer = "Sorry, that emoticon was not found"
       answer
    end
  end
end




#hash should look like the below
#{
 #     'happy' => {
  #       :english => ":)",
   #      :japanese => "(＾ｖ＾)"
#      }
#   }