# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
  email: "capablanca@email.com",
  password: "password",
  image_url: "image.jpeg",
)

User.create!(
  email: "Gary@email.com",
  password: "password",
  image_url: "image.jepg",
)

Opening.create!(
  name: "Queen's Gambit",
  image_url: "https://images.chesscomfiles.com/uploads/v1/images_users/tiny_mce/ColinStapczynski/phpjrGadn.png",
  description: "White chooses to play the Queen’s Gambit because it gives him the opportunity to exchange his wing pawn to gain more control of the center. This leads to positions where White can constantly put pressure on his opponent. The Queen's Gambit can force black to either lose control of the center or having to play in a cramped position.",
  difficulty: "Beginner",
  variation: "1. d4 d5 2. c4",
)

Opening.create!(
  name: "Italian Game",
  image_url: "https://i.pinimg.com/736x/b5/98/57/b598577bb7c37943b93c0925725551fc--popular-square.jpg",
  description: "The Italian Game is one of the oldest openings in chess and has been around for centuries. This classical 1.e4 opening can lead to slower and positional games as well as open, tactical battles. Although very common among beginners, the Italian Game is a part of the repertoire of players of every level.",
  difficulty: "Medium",
  variation: "1. e4 e5 2. Nf3 Nc6 3. Bc4",
)

Opening.create!(
  name: "Four Knights Game",
  image_url: "https://i0.wp.com/chesspathways.com/wp-content/uploads/2019/08/18a-298x300.png?ssl=1",
  description: "The Four Knights is a double king pawn opening in which both players develop their knights to ideal squares, pointed towards the center. Formerly considered a bit of a dinosaur, this opening has become somewhat popular again recently; it can lead to either sharp attacks or closed, maneuvering struggles.",
  difficulty: "Beginner",
  variation: "1. e4 e5 2. Nf3 Nc6 3. Nc3 Nf6",
)

Opening.create!(
  name: "Sicilian Defense",
  image_url: "https://www.thechesswebsite.com/wp-content/uploads/2012/07/sicilian-big.jpg",
  description: "he Sicilian Defense is the most popular response to White's 1.e4. Employed by masters and beginners alike, the Sicilian Defense is a reputable and positionally sound opening. Still, the Sicilian is a combative opening that tends to lead to dynamic and sharp positions. One of the oldest registered openings, the Sicilian is full of theory and was used by most of the greatest players in history. World champions GMs Bobby Fischer, Garry Kasparov, Viswanathan Anand, Vladimir Kramnik, and Magnus Carlsen are just a few of its adopters.",
  difficulty: "Hard",
  variation: "1. e4 c5",
)

Study.create!(
  user_id: 1,
  opening_id: 1,
  notes: "very good",
  public: true,
)

Study.create!(
  user_id: 1,
  opening_id: 3,
  notes: "very nice",
  public: false,
)

Study.create!(
  user_id: 2,
  opening_id: 3,
  notes: "love it",
)
