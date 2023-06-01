
# Tom user's

first_user = User.create!(name: 'Tom', user_avatar: 'https://drive.google.com/uc?id=1vDckZ740UU_vCPzcDF1Uaqy-95jQYvAE', email: 'tom@email.com', password: '123456')
second_user = User.create!(name: 'Lilly', user_avatar: 'https://drive.google.com/uc?id=1vDckZ740UU_vCPzcDF1Uaqy-95jQYvAE', email: 'lilly@email.com', password: '123456')
third_user = User.create!(name: 'Luis', user_avatar: 'https://drive.google.com/uc?id=1vDckZ740UU_vCPzcDF1Uaqy-95jQYvAE', email: 'luis@email.com', password: '123456')

# Tom's Categories

first_categ = Category.create!(name: 'Food', icon: 'https://img.icons8.com/color/512/kawaii-taco', author: first_user)
second_categ = Category.create!(name: 'Education', icon: 'https://img.icons8.com/office/512/knowledge-sharing', author: first_user)
third_categ = Category.create!(name: 'Pet', icon: 'https://img.icons8.com/color/512/cat-caregivers', author: first_user)
fourth_categ = Category.create!(name: 'Health', icon: 'https://img.icons8.com/office/512/caduceus', author: first_user)

# Lilly Categories

sixth_categ = Category.create!(name: 'Entertainment', icon: 'https://img.icons8.com/color/512/joystick', author: second_user)

# Payment

payment1 = Payment.create!(name: 'Udemy NextJs Course', amount: 29.9, author: first_user)
payment2 = Payment.create!(name: 'Udemy Rails Course', amount: 19.9, author: first_user)
second_categ.payments << payment1
second_categ.payments << payment2

payment3 = Payment.create!(name: "Watch Movie", amount: 15, author: second_user)
sixth_categ.payments << payment3

