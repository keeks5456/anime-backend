Comment.destroy_all
Post.destroy_all
User.destroy_all


require 'faker'
require 'httparty'
require 'rest_client'

  # class GetAnimeImage

  #   def self.get_image
  #     image_url = "https://api.jikan.moe/v3/anime/1/pictures/5"
  #     response = HTTParty.get(image_url)
  #     byebug
  #     parsed = JSON.parse(response.body)
  #     byebug
  #   end

  # end
  # GetAnimeImage.get_image



   users1 = User.create({
      username: Faker::FunnyName.name,
      artwork: "https://i.pinimg.com/originals/a4/2a/44/a42a4479c62c774b997cb4eff9ebb319.jpg",
      description: "cool beans"
    })
    users2 = User.create({
      username: Faker::FunnyName.name,
      artwork: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/9c6b0742-9f7f-43c2-a2e4-592964071127/dbcyxou-72692287-9983-44ff-bd7d-ac121088d152.png/v1/fill/w_400,h_625,strp/brown_hair_anime_girl_render_by_thigrizzle_dbcyxou-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD02MjUiLCJwYXRoIjoiXC9mXC85YzZiMDc0Mi05ZjdmLTQzYzItYTJlNC01OTI5NjQwNzExMjdcL2RiY3l4b3UtNzI2OTIyODctOTk4My00NGZmLWJkN2QtYWMxMjEwODhkMTUyLnBuZyIsIndpZHRoIjoiPD00MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.E84qFzMyzUNQuY1gHx2Lo2cExVO-B644-0DPLnCQG7A",
      description: "cool beans"

    })
    users3 = User.create({
      username: Faker::FunnyName.name,
      artwork: "https://cdn.vox-cdn.com/thumbor/du79s36XcdSLiXDqCzWkIBeV7nU=/0x0:1600x900/1200x800/filters:focal(672x322:928x578)/cdn.vox-cdn.com/uploads/chorus_image/image/66320060/Tanjiro__Demon_Slayer_.0.png",
      description: "cool beans"
    })


    Comment.create({
      likes: rand(1.. 20),

      user_id: users1
    })
    Comment.create({
      likes: rand(1.. 20),
      user_id: users2
    })
    Comment.create({
      likes: rand(1.. 20),
      user_id: users3
    })
    

    Post.create({
      likes: rand(1.. 20),
      user_id: users1
    })
    Post.create({
      likes: rand(1.. 20),
      user_id: users2
    })
    Post.create({
      likes: rand(1.. 20),
      user_id: users3
    })

    puts 'seeds done'