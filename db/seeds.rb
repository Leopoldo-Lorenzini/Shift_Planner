# Limpia la base de datos
User.destroy_all
Place.destroy_all
Itinerary.destroy_all
SectionGroup.destroy_all

# Crear usuarios
users = []
5.times do |i|
  users << User.create(
    name: "User #{i+1}",
    mail: "user#{i+1}@example.com",
    password: "password#{i+1}",
    phone: "123-456-789#{i}",
    description: "Description for user #{i+1}",
    data: "Data #{i+1}"
  )
end

# Crear lugares
places = []
2.times do |i|
  places << Place.create(
    name: "Place #{i+1}"
  )
end

# Crear itinerarios
10.times do |i|
  Itinerary.create(
    status: ["Conductor", "Pasagero"].sample,
    day: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"].sample,
    h_start: "07:00",
    h_end: "08:30",
    user: users.sample,
    starting_place: places.sample,
    ending_place: places.sample
  )
end

# Crear grupos de secciones
10.times do |i|
  SectionGroup.create(
    n_seats: rand(1..10).to_s,
    cost: rand(1000..3000).to_s,
    h_start: "07:00",
    h_end: "08:30",
    user: users.sample,
    starting_place: places.sample,
    ending_place: places.sample
  )

end