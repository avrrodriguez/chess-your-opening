require "rails_helper"

RSpec.describe "Openings", type: :request do
  describe "GET /openings" do
    # let(:openings) { create_list(:opening, 4) }

    before do
      FactoryBot.create_list(:opening, 3)
      get "/openings.json"
    end

    it "returns a 200 http status for index action" do
      expect(response).to have_http_status(200)
    end

    it "returns an array of openings" do
      openings = JSON.parse(response.body)

      expect(openings.length).to eq(3)
    end
  end

  describe "GET /openings/:id" do
    before do
      opening = FactoryBot.create(:opening)
    end

    it "returns a 200 http status for show action" do
      opening = Opening.first
      get "/openings/#{opening.id}.json"

      expect(response).to have_http_status(200)
    end

    it "returns an array of a post" do
      opening = Opening.first

      get "/openings/#{opening.id}.json"
      opening = JSON.parse(response.body)

      expect(opening["name"]).to eq(opening["name"])
      expect(opening["description"]).to eq(opening["description"])
      expect(opening["difficulty"]).to eq(opening["difficulty"])
      expect(opening["variation"]).to eq(opening["variation"])
    end
  end

  describe "POST /openings" do
    before do
      user = FactoryBot.create(:user, :admin)
    end

    it "returns a hash with appropriate attributes" do
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )

      post "/openings.json", params: {
                               name: "Queen's Gambit",
                               description: "White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.",
                               difficulty: "Beginner",
                               variation: "1. d4 d5 2. c4",
                             }, headers: { "Authorization" => "Bearer #{jwt}" }
      opening = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(opening["name"]).to eq("Queen's Gambit")
      expect(opening["description"]).to eq("White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.")
      expect(opening["difficulty"]).to eq("Beginner")
      expect(opening["variation"]).to eq("1. d4 d5 2. c4")
    end

    it "returns unauthorized when no jwt is provided (user is not logged in)" do
      post "/openings.json", params: {
                               name: "Queen's Gambit",
                               description: "White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.",
                               difficulty: "Beginner",
                               variation: "1. d4 d5 2. c4",
                             }
      opening = JSON.parse(response.body)

      expect(response).to have_http_status(:unauthorized)
    end

    it "returns unprocessable entity with bad data" do
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )

      post "/openings.json", params: {}, headers: { "Authorization" => "Bearer #{jwt}" }
      error = JSON.parse(response.body)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH /openings/:id" do
    before do
      opening = FactoryBot.create(:opening)
      user = FactoryBot.create(:user, :admin)
    end

    it "returns a hash with updated values" do
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )

      patch "/openings/#{opening.id}.json", params: { name: "new name" }, headers: { "Authorization" => "Bearer #{jwt}" }
      opening = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(opening["name"]).to eq("new name")
      expect(opening["description"]).to eq("White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.")
      expect(opening["difficulty"]).to eq("Beginner")
      expect(opening["variation"]).to eq("1. d4 d5 2. c4")
    end

    it "returns unauthorized when no jwt is provided (user is not logged in)" do
      user = User.first
      opening = FactoryBot.create(:opening)
      patch "/openings/#{opening.id}.json", params: { name: "new name" }

      error = JSON.parse(response.body)

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "DELETE /openings/:id" do
    before do
      opening = FactoryBot.create(:opening)
      user = FactoryBot.create(:user, :admin)
    end

    it "returns a 200 status for delete action" do
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )

      delete "/openings/#{opening.id}.json", headers: { "Authorization" => "Bearer #{jwt}" }

      expect(response).to have_http_status(200)
    end

    it "returns unauthorized when no jwt is provided (user is not logged in)" do
      opening = Opening.last
      delete "/openings/#{opening.id}.json"

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
