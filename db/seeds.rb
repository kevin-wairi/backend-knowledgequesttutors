
# Run 'rails db:seed' in the terminal to execute these seed entries
User.delete_all
User.create!(username:'Admin',school: '',course:'Manager',email:'admin.mail.com',phoneNumber:'0987654321',password:'james',password_confirmation:'james',isAdmin:'true')

# img:'https://cdn-icons-png.flaticon.com/512/706/706830.png'
# img:'https://cdn-icons-png.flaticon.com/512/4322/4322992.png'

Question.create(
    user_id: 2,
    topic: 'Computer Science',
    deliverytime:'Mon Jan 29 20',
    academicLevel: 'Masters',
    subject: 'How does virtual memory work?',
    details: 'I need a detailed explanation of how virtual memory functions in operating systems.',
    pageCount: 5,
    budget: 50, 
)

  # Message.create!(user_id: 1, receiver_id: 2, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/4322/4322992.png", content: "Good James, wassup", read_status: true, delivery_status: true)
  # Message.create!(user_id: 2, receiver_id: 1, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/1326/1326377.png", content: "Hey Alex! Not much, just trying to figure out this school assignment. Have you started?", read_status: false, delivery_status: true)
  # Message.create!(user_id: 1, receiver_id: 2, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/4322/4322992.png", content: "Yeah, I've started working on it. It seems a bit challenging though. How about you?", read_status: false, delivery_status: true)
  # Message.create!(user_id: 2, receiver_id: 1, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/1326/1326377.png", content: "I haven't even looked at it yet. 😅 Can you give me some ideas on how to approach it?", read_status: false, delivery_status: true)
  # Message.create!(user_id: 1, receiver_id: 2, chat_id: "1", user_img: "https://cdn-icons-png.flaticon.com/512/4322/4322992.png", content: "Sure! Let's break it down together. What do you think is the most challenging part?", read_status: false, delivery_status: true)