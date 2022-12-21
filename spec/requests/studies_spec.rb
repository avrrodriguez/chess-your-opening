require "rails_helper"

RSpec.describe "Studies", type: :request do
  describe "GET /studies" do
    before do
      opening = FactoryBot.create(:opening)
      opening2 = FactoryBot.create(:opening)
      user = FactoryBot.create(:user, :admin)
      user2 = FactoryBot.create(:user, :admin, email: "capablanca@email.com")
      FactoryBot.create(:study, user_id: user.id, opening_id: opening.id)
      FactoryBot.create(:study, user_id: user2.id, opening_id: opening.id)
      FactoryBot.create(:study, user_id: user.id, opening_id: opening2.id)
    end

    it "returns an array of public studies" do
      get "/studies.json"
      studies = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(studies.length).to eq(3)
    end

    it "return an array of a users and public studies" do
      user = User.first

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
