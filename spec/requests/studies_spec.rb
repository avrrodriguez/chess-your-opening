require "rails_helper"

RSpec.describe "Studies", type: :request do
  describe "GET /studies" do
    it "returns an array of public studies" do
      User.create!(
        email: "Gary@email.com",
        password: "password",
        image_url: "image.jepg",
      )

      user1 = User.first
      user2 = User.second

      opening1 = Opening.create!(
        name: "Queen's Gambit",
        description: "White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.",
        difficulty: "Beginner",
        variation: "1. d4 d5 2. c4",
      )

      Opening.create!(
        name: "Italian Game",
        description: "The Italian Game is one of the oldest openings in chess and has been around for centuries. This classical 1.e4 opening can lead to slower and positional games as well as open, tactical battles. Although very common among beginners, the Italian Game is a part of the repertoire of players of every level.",
        difficulty: "Medium",
        variation: "1. e4 e5 2. Nf3 Nc6 3. Bc4",
      )

      opening3 = Opening.create!(
        name: "Four Knights Game",
        description: "The Four Knights is a double king pawn opening in which both players develop their knights to ideal squares, pointed towards the center. Formerly considered a bit of a dinosaur, this opening has become somewhat popular again recently; it can lead to either sharp attacks or closed, maneuvering struggles.",
        difficulty: "Beginner",
        variation: "1. e4 e5 2. Nf3 Nc6 3. Nc3 Nf6",
      )

      Opening.create!(
        name: "Sicilian Defense",
        description: "he Sicilian Defense is the most popular response to White's 1.e4. Employed by masters and beginners alike, the Sicilian Defense is a reputable and positionally sound opening. Still, the Sicilian is a combative opening that tends to lead to dynamic and sharp positions. One of the oldest registered openings, the Sicilian is full of theory and was used by most of the greatest players in history. World champions GMs Bobby Fischer, Garry Kasparov, Viswanathan Anand, Vladimir Kramnik, and Magnus Carlsen are just a few of its adopters.",
        difficulty: "Hard",
        variation: "1. e4 c5",
      )

      Study.create!(
        user_id: user1.id,
        opening_id: opening1.id,
        notes: "very good",
        public: true,
      )

      Study.create!(
        user_id: user1.id,
        opening_id: opening3.id,
        notes: "very nice",
        public: false,
      )

      Study.create!(
        user_id: user1.id,
        opening_id: opening3.id,
        notes: "very nice",
        public: true,
      )

      get "/studies.json"
      studies = JSON.parse(response.body)
      studies = studies.filter { |study| study["public"] == true }

      expect(response).to have_http_status(200)
      expect(studies.length).to eq(2)
    end

    it "return an array of a users and public studies" do
      user = User.first
      opening1 = Opening.create!(
        name: "Queen's Gambit",
        description: "White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.",
        difficulty: "Beginner",
        variation: "1. d4 d5 2. c4",
      )
      opening3 = Opening.create!(
        name: "Four Knights Game",
        description: "The Four Knights is a double king pawn opening in which both players develop their knights to ideal squares, pointed towards the center. Formerly considered a bit of a dinosaur, this opening has become somewhat popular again recently; it can lead to either sharp attacks or closed, maneuvering struggles.",
        difficulty: "Beginner",
        variation: "1. e4 e5 2. Nf3 Nc6 3. Nc3 Nf6",
      )
      Study.create!(
        user_id: user.id,
        opening_id: opening1.id,
        notes: "very good",
        public: true,
      )

      Study.create!(
        user_id: user.id,
        opening_id: opening3.id,
        notes: "very nice",
        public: false,
      )

      Study.create!(
        user_id: user.id,
        opening_id: opening3.id,
        notes: "very nice",
        public: true,
      )
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
