require "rails_helper"

RSpec.describe "Openings", type: :request do
  describe "GET /openings" do
    it "returns a 200 http status for index action" do
      get "/openings.json"

      expect(response).to have_http_status(200)
    end

    it "returns an array of openings" do
      Opening.create!(
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

      Opening.create!(
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

      get "/openings.json"
      openings = JSON.parse(response.body)

      expect(openings.length).to eq(4)
    end
  end

  describe "GET /openings/:id" do
    it "returns a 200 http status for show action" do
      opening = Opening.create!(
        name: "Queen's Gambit",
        description: "White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.",
        difficulty: "Beginner",
        variation: "1. d4 d5 2. c4",
      )
      get "/openings/#{opening.id}.json"

      expect(response).to have_http_status(200)
    end

    it "returns an array of a post" do
      opening = Opening.create!(
        name: "Queen's Gambit",
        description: "White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.",
        difficulty: "Beginner",
        variation: "1. d4 d5 2. c4",
      )

      get "/openings/#{opening.id}.json"
      opening = JSON.parse(response.body)

      expect(opening["name"]).to eq("Queen's Gambit")
      expect(opening["description"]).to eq("White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.")
      expect(opening["difficulty"]).to eq("Beginner")
      expect(opening["variation"]).to eq("1. d4 d5 2. c4")
    end
  end
end