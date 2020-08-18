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
     allImg = parsed['data'].flatten.map{|animeImg| animeImg['attributes']['posterImage']['original']}
    end

  end
  GetAnimeImage.get_image


  4.times {
  User.create({
      username: Faker::FunnyName.name,
      artwork: GetAnimeImage.get_image,
      description: Faker::Quotes::Shakespeare.hamlet_quote
    })
  }
  


    


    puts 'seeds done'