# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'

game = {}
# Catan

game_selection = (001..500).to_a.sample
URL = "https://www.boardgamegeek.com/xmlapi2/thing?id=#{game_selection}"

data = open(URL).read
xml_doc = Nokogiri::HTML(data)

name_array = []
xml_doc.search('name').each do |ele|
  name_array << ele.values.split(',')[0].last
end

game[:name] = name_array[0]

playingtime_array = []
xml_doc.search('playingtime').each do |ele|
  playingtime_array << ele.values.split(',')[0].last
end

game[:playingtime] = playingtime_array[0]

boardgamecategory_array = []
xml_doc.search('[type="boardgamecategory"]').each do |ele|
  boardgamecategory_array << ele.values[2]

end

game[:category] = boardgamecategory_array.first

boardgamemechanic_array = []
xml_doc.search('[type="boardgamemechanic"]').each do |ele|
  boardgamemechanic_array << ele.values[2]

end

game[:mechanic] = boardgamemechanic_array.first

boardgamedesigner_array = []
xml_doc.search('[type="boardgamedesigner"]').each do |ele|
  boardgamedesigner_array << ele.values[2]

end

game[:designer] = boardgamedesigner_array.first

xml_doc.search('image').each do |ele|
  game[:image_url] = ele.text
end

thumb_image = xml_doc.search('thumbnail').each do |ele|
  game[:thumb_url] = ele.text
end

var = Game.new(game)
p var

# p main_image = image_array.first


# catanName = document.getElementById("catanName");
#             catanName.innerHTML = xmlDoc.getElementsByTagName("name")[0].getAttribute('value');

# p catanName = name.innerHTML = xml_doc.getElementsByTagName("name")[0].getAttribute('value');
