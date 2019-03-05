# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  yaml_hash = YAML.load_file(path)
  return_hash = {"get_emoticon"=>{}, "get_meaning"=>{}}
  yaml_hash.each do |word, emoticons|
    return_hash["get_meaning"][emoticons[1]] = word
  end
  yaml_hash.each do |word, emoticons|
    return_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  return_emoticon = "Sorry, that emoticon was not found"
  emoticon_hash = load_library(file_path)
  emoticon_hash["get_emoticon"].each do |english_emoticon, japanese_emoticon|
    if emoticon == english_emoticon
      return_emoticon = japanese_emoticon
    end
  end
  return_emoticon
end

def get_english_meaning(file_path, emoticon)
  return_meaning = "Sorry, that emoticon was not found"
  emoticon_hash = load_library(file_path)
  emoticon_hash["get_meaning"].each do |japanese_emoticon, meaning|
    if emoticon == japanese_emoticon
      return_meaning = meaning
    end
  end
  return_meaning
end

puts "Enter an English emoticon:"
input = gets.chomp
puts get_japanese_emoticon("emoticons.yml", input)
