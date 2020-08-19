Comment.destroy_all
Post.destroy_all
User.destroy_all


require 'faker'
require 'httparty'
require 'rest_client'


  class GetAnimeImage
    def self.get_image
      image_url = "https://kitsu.io/api/edge/trending/anime"
      response = HTTParty.get(image_url)
      parsed = JSON.parse(response.body)
    # byebug
     all_Img = parsed['data'].map{|animeImg| animeImg['attributes']['posterImage']['original']}
    #  byebug
     map_Img = all_Img.map {|image| image.to_s }
    #  this returns a string of strings 
    #here we can grab the images by index with map_Img[0] or [2]
    # but will this be possible for our fetch data to do?
    end
  end
  GetAnimeImage.get_image

  class GetAnimeDescription 
    def self.get_description
      description = "https://kitsu.io/api/edge/trending/anime"
      response = HTTParty.get(description)
      parsed = JSON.parse(response.body)
      all_Text = parsed['data'].map{ |animeTxt| animeTxt['attributes']['synopsis']}
      # map_Text = all_Text.map {|image|  image}

      # this gives back an array of strings of the descriptions
      # can be accessed through its index all_text[0] 
    # byebug
    end
  end
  GetAnimeDescription.get_description


   user1 = User.create({
      username: Faker::FunnyName.name,
      artwork: GetAnimeImage.get_image[0],
      description: GetAnimeDescription.get_description[0]
   })

   user2 = User.create({
    username: Faker::FunnyName.name,
    artwork: GetAnimeImage.get_image[1],
    description: GetAnimeDescription.get_description[1]
 })

 user3 = User.create({
  username: Faker::FunnyName.name,
  artwork: GetAnimeImage.get_image[2],
  description: GetAnimeDescription.get_description[2]
})

user4 = User.create({
  username: Faker::FunnyName.name,
  artwork: GetAnimeImage.get_image[3],
  description: GetAnimeDescription.get_description[3]
})

user5 = User.create({
  username: Faker::FunnyName.name,
  artwork: GetAnimeImage.get_image[4],
  description: GetAnimeDescription.get_description[4]
})

user6 = User.create({
  username: Faker::FunnyName.name,
  artwork: GetAnimeImage.get_image[5],
  description: GetAnimeDescription.get_description[5]
})


    


  
  puts 'seeds done'