# Chess Your Opening

(Back end)

Often times the first 10 moves of a chess game can be enough to determine who wins and loses. Looking over websites and chess books, I felt like the entry point for openings in chess was a bit difficult. A person would have a lot of motivation and love for chess to be able to read through pages and pages of chess notation stating moves of openings and their variation. I felt like something a bit more beginner friendly was needed so that they can ease their way into learning about openings.

This git hub repo is the back end for the application, you can find the front end I built [here](https://github.com/avrrodriguez/chess-your-opening-frontend).

- It is a RESTful API with MVC architecture built with Ruby on Rails.
- It has User authentication using JSON web tokens.
- It can store information about openings, studies, resources for openings, and common positions of openings.

## Installation

```bash
bundle install
rails db:create db:migrate db:seed
```

You can test web requests as documented in the `requests.http` file.

## Usage

```bash
rails server
```

To make studies public or private change it through the rails console. The number inside find is replaced by the id of the study whos public you want to change.

```bash
rails c
irb(main) > study = Study.find(1)
irb(main) > study.public = true # or study.public = false to make it private
irb(main) > study.save
```

Follow the same steps for making a user an admin.

```bash
rails c
irb(main) > user = User.find(1)
irb(main) > user.admin = true # or user.admin = false if you want to remove admin
irb(main) > user.save
```
