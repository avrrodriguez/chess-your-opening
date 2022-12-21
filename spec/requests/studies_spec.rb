require "rails_helper"

RSpec.describe "Studies", type: :request do
  describe "GET /studies" do
    before do
      FactoryBot.create(:user, :admin)
    end

    it "returns an array of public studies" do
      user1 = User.first
      user2 = User.second

      Study.create!(
        user_id: user1.id,
        opening_id: Opening.first.id,
        notes: "very good",
        public: true,
      )

      Study.create!(
        user_id: user1.id,
        opening_id: Opening.all[2].id,
        notes: "very nice",
        public: false,
      )

      Study.create!(
        user_id: user1.id,
        opening_id: Opening.all[2].id,
        notes: "very nice",
        public: true,
      )

      get "/studies.json"
      studies = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(studies.length).to eq(2)
    end

    it "return an array of a users and public studies" do
      user = User.first

      opening1 = Opening.all[0]
      opening3 = Opening.all[2]

      # Study.create!(
      #   user_id: user.id,
      #   opening_id: opening1.id,
      #   notes: "very good",
      #   public: true,
      # )

      # Study.create!(
      #   user_id: user.id,
      #   opening_id: opening3.id,
      #   notes: "very nice",
      #   public: false,
      # )

      # Study.create!(
      #   user_id: user.id,
      #   opening_id: opening3.id,
      #   notes: "very nice",
      #   public: true,
      # )
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )

      get "/studies.json", headers: { "Authorization" => "Bearer #{jwt}" }
      studies = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(studies.length).to eq(3)
    end
  end
end
