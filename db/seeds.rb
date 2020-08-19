  Comment.destroy_all
  Post.destroy_all
  User.destroy_all


  require 'faker'
  require 'httparty'
  require 'rest_client'

    class GetAnimeDescription 
      def self.get_description_image
        description = "https://kitsu.io/api/edge/trending/anime"
        response = HTTParty.get(description)
        parsed = JSON.parse(response.body)
        all_Text = parsed['data'].map{ |anime| {description: anime['attributes']['synopsis'], image: anime['attributes']['posterImage']['original']}}
      end
    end

    10.times do
      User.create({
        username: Faker::FunnyName.name,
      })
    end
    # make sure this is here above so the post knows its user

    GetAnimeDescription.get_description_image.each do |animeHash|
      byebug
       Post.create(artwork: animeHash[:image], description: animeHash[:description], user_id: User.all.sample.id, likes: rand(1..10))
    end
  
  puts 'seeds done'