# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

user = User.create(name: "seed", email: "seed@seed.com", password: "seed1111")

# 先月のデータ
last_month = Date.today.prev_month

Skill.create!(
  user: user,
  skill: "Rails",
  learning_time: 50,
  category: "backend",
  created_at: last_month
)

Skill.create!(
  user: user,
  skill: "jQuery",
  learning_time: 20,
  category: "frontend",
  created_at: last_month
)

Skill.create!(
  user: user,
  skill: "AWS",
  learning_time: 10,
  category: "infrastructure",
  created_at: last_month
)

# 先々月のデータ
last_last_month = Date.today.prev_month(2)

Skill.create!(
  user: user,
  skill: "Rails",
  learning_time: 40,
  category: "backend",
  created_at: last_last_month
)

Skill.create!(
  user: user,
  skill: "jQuery",
  learning_time: 15,
  category: "frontend",
  created_at: last_last_month
)

Skill.create!(
  user: user,
  skill: "AWS",
  learning_time: 8,
  category: "infrastructure",
  created_at: last_last_month
)

