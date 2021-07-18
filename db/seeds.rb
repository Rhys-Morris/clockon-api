# Seed User if empty

if User.count == 0
    User.create(name: 'Rhys', email: 'rhysmorris08@gmail.com', password: 'test')
    puts "Created test user"
end