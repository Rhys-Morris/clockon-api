# Seed User if empty

if User.count == 0
    User.create(name: 'test', email: 'test@test.com', password: 'password')
    puts "Created test user"
end

if Client.count == 0
    Client.create(name: "Test Client 1", email: "test1@email.com", contact: "John Doe", active: true, user_id: 1)
    Client.create(name: "Test Client 2", email: "test2@email.com", contact: "John Doe", active: true, user_id: 1)
    Client.create(name: "Test Client 3", email: "test3@email.com", contact: "John Doe", active: true, user_id: 1)
    puts "Seeded test clients to test user"
end