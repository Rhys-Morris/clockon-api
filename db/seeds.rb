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

if Project.count == 0
    Project.create(name: "Test Project 1", color: "#ff0000", due_date: "2022-10-10", billable: true, billable_rate: 35, active: true, user_id: 1, client_id: 1)
    Project.create(name: "Test Project 2", color: "#00ff00", due_date: "2022-10-10", billable: false, billable_rate: 35, active: true, user_id: 1, client_id: 2)
    Project.create(name: "Test Project 3", color: "#ffff00", due_date: "2022-10-10", billable: true, billable_rate: 35, active: false, user_id: 1, client_id: 3)
end