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
User.create(username:'Admin',school: '',course:'',email:'admin.mail.com',phoneNumber:'0987654321',password:'james',password_confirmation:'james',img:'

',isAdmin:'true')
User.create(username:'james',school: 'schoolA',course:'IT',email:'james.mail.com',phoneNumber:'123456789',password:'james',password_confirmation:'james',img:'https://cdn-icons-png.flaticon.com/512/4322/4322992.png',isAdmin:'false')
User.create(username:'john',school: 'schoolB',course:'IT',email:'john.mail.com',phoneNumber:'123456789',password:'john',password_confirmation:'john',img:'https://cdn-icons-png.flaticon.com/512/706/706830.png',isAdmin:'false')
User.create(username: 'jeff', school: 'schoolC',course:'IT',email:'jeff.mail.com',phoneNumber:'123456789',password:'jeff',password_confirmation:'jeff',img:'https://cdn-icons-png.flaticon.com/512/4322/4322992.png',isAdmin:'false')
User.create(username: 'jackson', school: 'schoolD',course:'IT',email:'jackson.mail.com',phoneNumber:'123456789',password:'jackson',password_confirmation:'jackson',img:'https://cdn-icons-png.flaticon.com/512/4322/4322992.png',isAdmin:'false')
User.create(username: 'jack', school: 'schoolD',course:'IT',email:'254wairi@gmail.com',phoneNumber:'123456789',password:'jackson',password_confirmation:'jackson',img:'https://cdn-icons-png.flaticon.com/512/4322/4322992.png',isAdmin:'false')


# message1 = user1.messages.create(chat_id: 1, content: 'Hello user2', read_status: false, delivery_status: false)
# message2 = user2.messages.create(chat_id: 1, content: 'Hi user1', read_status: false, delivery_status: false)
# message3 = user1.messages.create(chat_id: 2, content: 'How are you?', read_status: false, delivery_status: false)
# message4 = user2.messages.create(chat_id: 2, content: 'I\'m good, thank you!', read_status: false, delivery_status: false)

Question.create(
    user_id: 1,
    subject: 'Computer Science',
    title: 'How does virtual memory work?',
    details: 'I need a detailed explanation of how virtual memory functions in operating systems.',
    school: 'Sample University',
    course: 'Computer Science',
    pageCount: 5,
    deliverytime: 24, 
    academicLevel: 'Masters',
    budget: 50, 
)
Question.create(
    user_id: 2,
    subject: 'Mathematics',
    title: 'Prove Fermat\'s Last Theorem',
    details: 'I am looking for a mathematical proof of Fermat\'s Last Theorem.',
    school: 'Another University',
    course: 'Mathematics',
    pageCount: 10,
    deliverytime: 48, 
    academicLevel: 'PHD',
    budget: 150, 
  )
  Question.create(
    user_id: 3,
    subject: 'History',
    title: 'Impact of the Industrial Revolution',
    details: 'Discuss the significant impact of the Industrial Revolution on society and the economy.',
    school: 'History University',
    course: 'History',
    pageCount: 8,
    deliverytime: 36, 
    academicLevel: 'College',
    budget: 40, 
  )
  Question.create(
    user_id: 1,
    subject: 'Science',
    title: 'Genetic Engineering Ethics',
    details: 'Explore the ethical considerations in genetic engineering and gene editing technologies.',
    school: 'Sample University',
    course: 'Biotechnology',
    pageCount: 6,
    deliverytime: 72, 
    academicLevel: 'Masters',
    budget: 60, 
  )
  Question.create(
    user_id: 2,
    subject: 'Business & Finance',
    title: 'Impact of Cryptocurrency on Global Economy',
    details: 'Analyze the impact of cryptocurrencies on the global economy and financial systems.',
    school: 'Finance Institute',
    course: 'Finance',
    pageCount: 12,
    deliverytime: 48, 
    academicLevel: 'PHD',
    budget: 120, 
  )

  # Message.create!(user_id: 1, receiver_id: 2, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/4322/4322992.png", content: "Good James, wassup", read_status: true, delivery_status: true)
  # Message.create!(user_id: 2, receiver_id: 1, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/1326/1326377.png", content: "Hey Alex! Not much, just trying to figure out this school assignment. Have you started?", read_status: false, delivery_status: true)
  # Message.create!(user_id: 1, receiver_id: 2, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/4322/4322992.png", content: "Yeah, I've started working on it. It seems a bit challenging though. How about you?", read_status: false, delivery_status: true)
  # Message.create!(user_id: 2, receiver_id: 1, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/1326/1326377.png", content: "I haven't even looked at it yet. 😅 Can you give me some ideas on how to approach it?", read_status: false, delivery_status: true)
  # Message.create!(user_id: 1, receiver_id: 2, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/4322/4322992.png", content: "Sure! Let's break it down together. What do you think is the most challenging part?", read_status: false, delivery_status: true)