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
    passeword: "password#{i+1}",
    phone: "123-456-789#{i}",
    description: "Description for user #{i+1}",
    data: "Data #{i+1}"
  )
end

# Crear lugares
places = []
5.times do |i|
  places << Place.create(
    name: "Place #{i+1}"
  )
end

# Crear itinerarios
10.times do |i|
  Itinerary.create(
    status: ["planned", "in_progress", "completed"].sample,
    day: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"].sample,
    h_start: "08:00",
    h_end: "17:00",
    user: users.sample,
    starting_place: places.sample,
    ending_place: places.sample
  )
end

# Crear grupos de secciones
10.times do |i|
  SectionGroup.create(
    n_seats: rand(1..100).to_s,
    cost: rand(50..500).to_s,
    h_start: "09:00",
    h_end: "18:00",
    user: users.sample,
    starting_place: places.sample,
    ending_place: places.sample
  )
  
end
