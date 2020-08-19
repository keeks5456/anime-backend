  Comment.destroy_all
  Post.destroy_all
  User.destroy_all


  require 'faker'
  require 'httparty'
  require 'rest_client'


    # class GetAnimeImage
    #   def self.get_image
    #     image_url = "https://kitsu.io/api/edge/trending/anime"
    #     response = HTTParty.get(image_url)
    #     parsed = JSON.parse(response.body)
    #   # byebug
    #   all_Img = parsed['data'].map{|animeImg| animeImg['attributes']['posterImage']['original']}
    #   #  byebug
    #   map_Img = all_Img.map {|image| image.to_s }
    #   #  this returns a string of strings 
    #   #here we can grab the images by index with map_Img[0] or [2]
    #   # but will this be possible for our fetch data to do?
    #   end
    # end
    # GetAnimeImage.get_image




    class GetAnimeDescription 
      # def self.get_description
      #   description = "https://kitsu.io/api/edge/trending/anime"
      #   response = HTTParty.get(description)
      #   parsed = JSON.parse(response.body)
      #   byebug
      #   all_Text = parsed['data'].map{ |animeTxt| animeTxt['attributes']['synopsis']}
      #   # map_Text = all_Text.map {|image|  image}

      #   # this gives back an array of strings of the descriptions
      #   # can be accessed through its index all_text[0] 
      # # byebug
      # end

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