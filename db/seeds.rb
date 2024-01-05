# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create a user

# Create a question associated with the user


# Run 'rails db:seed' in the terminal to execute these seed entries
User.create(username:'james',school: 'schoolA',course:'IT',email:'james.mail.com',phoneNumber:'123456789',password:'james',password_confirmation:'james')


user1 = User.create(username: 'user1', school: 'schoolA',course:'IT',email:'james.mail.com',phoneNumber:'123456789',password:'james',password_confirmation:'james')
user2 = User.create(username: 'user2', school: 'schoolA',course:'IT',email:'james.mail.com',phoneNumber:'123456789',password:'james',password_confirmation:'james')


# message1 = user1.messages.create(chat_id: 1, content: 'Hello user2', read_status: false, delivery_status: false)
# message2 = user2.messages.create(chat_id: 1, content: 'Hi user1', read_status: false, delivery_status: false)
# message3 = user1.messages.create(chat_id: 2, content: 'How are you?', read_status: false, delivery_status: false)
# message4 = user2.messages.create(chat_id: 2, content: 'I\'m good, thank you!', read_status: false, delivery_status: false)