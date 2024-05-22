# Limpia la base de datos
User.destroy_all
Place.destroy_all
Itinerary.destroy_all
SectionGroup.destroy_all
Membership.destroy_all

# Crear usuarios
users = []
5.times do |i|
  users << User.create(
    name: "User #{i+1}",
    email: "user#{i+1}@example.com",
    password: "123456",
    phone: "123-456-789#{i}",
    description: "Description for user #{i+1}",
    data: "nombre#{i};11.111.111-#{i};ncuenta#{i};tipocuenta#{i};banco#{i};email#{i}"
  )
end

# Crear lugares
uandes = Place.create(name: "Uandes")

additional_places = ["Copec", "Mall", "Plaza", "Supermercado", "Parque"]

additional_places.each do |place_name|
  Place.create(name: place_name)
end

# Crear itinerarios
10.times do |i|
  if i.even?
    starting_place = uandes
    ending_place = (Place.where.not(id: uandes.id)).sample
  else
    starting_place = (Place.where.not(id: uandes.id)).sample
    ending_place = uandes
  end

  Itinerary.create(
    status: ["Piloto", "Pasajero"].sample,
    day: ["lunes", "martes", "miércoles", "jueves", "viernes"].sample,
    h_start: "07:00",
    h_end: "08:30",
    is_active: [true, false].sample,
    user: users.sample,
    starting_place: starting_place,
    ending_place: ending_place
  )
end


# Crear grupos de secciones
10.times do |i|
  SectionGroup.create(
    n_seats: rand(1..10)
)
end