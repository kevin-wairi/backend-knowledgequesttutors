

# Run 'rails db:seed' in the terminal to execute these seed entries
User.create(username:'Admin',school: '',course:'Manager',email:'admin.mail.com',phoneNumber:'0987654321',password:'james',password_confirmation:'james',img:'https://cdn-icons-png.flaticon.com/512/706/706830.png',isAdmin:'true')
User.create(username:'james',school: 'schoolA',course:'IT',email:'james.mail.com',phoneNumber:'123456789',password:'james',password_confirmation:'james',img:'https://cdn-icons-png.flaticon.com/512/4322/4322992.png',isAdmin:'false')

Question.create(
    user_id: 1,
    topic: 'Computer Science',
    subject: 'How does virtual memory work?',
    details: 'I need a detailed explanation of how virtual memory functions in operating systems.',
    school: 'Sample University',
    pageCount: 5,
    deliverytime: 24, 
    academicLevel: 'Masters',
    budget: 50, 
)
Question.create(
    user_id: 2,
    topic: 'Mathematics',
    subject: 'Prove Fermat\'s Last Theorem',
    details: 'I am looking for a mathematical proof of Fermat\'s Last Theorem.',
    school: 'Another University',
    pageCount: 10,
    deliverytime: 48, 
    academicLevel: 'PHD',
    budget: 150, 
  )
  Question.create(
    user_id: 3,
    topic: 'History',
    subject: 'Impact of the Industrial Revolution',
    details: 'Discuss the significant impact of the Industrial Revolution on society and the economy.',
    school: 'History University',
    pageCount: 8,
    deliverytime: 36, 
    academicLevel: 'College',
    budget: 40, 
  )
  Question.create(
    user_id: 1,
    topic: 'Science',
    subject: 'Genetic Engineering Ethics',
    details: 'Explore the ethical considerations in genetic engineering and gene editing technologies.',
    school: 'Sample University',
    pageCount: 6,
    deliverytime: 72, 
    academicLevel: 'Masters',
    budget: 60, 
  )
  Question.create(
    user_id: 2,
    topic: 'Business & Finance',
    subject: 'Impact of Cryptocurrency on Global Economy',
    details: 'Analyze the impact of cryptocurrencies on the global economy and financial systems.',
    school: 'Finance Institute',
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