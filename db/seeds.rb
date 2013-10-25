# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Venue.destroy_all

Venue.create([{name: "Hollywood Bowl", cat: "Amphitheatre", size: 1000},
	{name: "Staples Center", cat: "Arena", size: 8000},
	{name: "Getty", cat: "Unique", size: 500},
	{name: "Ogden Theater", cat: "Open Theater", size: 300},
	{name: "Red Rocks", cat: "Amphitheatre", size: 1200}
	])