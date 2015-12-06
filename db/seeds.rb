# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Country.create([{name: 'Australia'}, {name: 'India'}])
Location.create(name: 'Sydney Cricket Ground', country_id: 1)
Player.create(name: 'Brett Lee', country_id: 1, batting_style: 0, bowling_style: 'Right Hand Fast Bowler', role: 1)
Player.create(name: 'Virat Kohli', country_id: 2, batting_style: 0, bowling_style: 'Right Hand Medium Pace', role: 0)
Code.create([{name: 'Test Match'}, {name: 'T20'}])

Squad.create(country_id: 1, code_id: 1)
Squad.create(country_id: 2, code_id: 1)
SquadPlayer.create(squad_id: 1, player_id: 1)
SquadPlayer.create(squad_id: 2, player_id: 2)