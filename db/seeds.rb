CollectiveGenre.destroy_all
Genre.destroy_all
Collective.destroy_all
User.destroy_all

# USERS
######################################################################
puts 'Creating some users...'
User.create!(
  [
    {
      name: 'meleu',
      password: 'asdfgçlkjh',
      email: 'meleu@temrole.org'
    },
    {
      name: 'douglasgpassos',
      password: 'asdfgçlkjh',
      email: 'douglas@temrole.org'
    },
    {
      name: 'marcosgabriel-smc',
      password: 'asdfgçlkjh',
      email: 'marcos@temrole.org'
    },
    {
      name: 'ze',
      password: 'asdfgçlkjh',
      email: 'ze@temrole.org'
    }
  ]
)
lewagang_owner = User.first
uzalemaum_owner = User.last

# COLLECTIVES
######################################################################
puts 'Creating collectives...'
Collective.create!(
  [
    {
      name: 'lewagang',
      description: 'mix masters pika das galaxias deluxe loren sajdlasjk jsdiowj lakdfka joiwej rqlk jrli lkehr  uasdh oa dowaha oiwh ethoi dlfh oie iroq niaekj nlaje eja flkdmj flj emdaç f jpaje ajkfea jaelk dgf osei jgsf kdslsj dfçg fkj ds k j',
      city: 'rio de janeiro',
      state: 'rj',
      owner: lewagang_owner
    },
    {
      name: 'uzalemaum',
      description: 'so tem pelasako',
      city: 'rio de janeiro',
      state: 'rj',
      owner: uzalemaum_owner
    }
  ]
)
lewagang = Collective.first

# MEMBERSHIP
######################################################################
User.first(3).each do |user|
  # the owner is automatically set as a member
  next if user == lewagang.owner

  Membership.create!(user:, collective: lewagang)
end

# EVENTS
######################################################################
puts "Creating some events..."
20.times do |i|
  collective = (i % 3).zero? ? Collective.last : Collective.first
  Event.create!(
    collective:,
    name: "Party #{i}",
    description: "This is the version #{i} of an awesome party!",
    start_time: DateTime.current + i,
    end_time: DateTime.tomorrow + i
  )
end

# GENRES
######################################################################
puts 'Creating some genres...'
Genre.create!(
  [
    { name: 'house' },
    { name: 'trance' },
    { name: 'drum&bass' },
    { name: 'techno' },
    { name: 'hard techno' },
    { name: 'jungle' },
    { name: 'acid house' },
    { name: 'dubstep' }
  ]
)
two_genres = Genre.last(2)

puts 'Assigning genres to the collective...'
two_genres.each do |genre|
  CollectiveGenre.create!(collective: lewagang, genre:)
end

######################################################################
puts 'Finished!'
