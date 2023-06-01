
# Tom user's

first_user = User.create!(name: 'Tom', user_avatar: 'https://drive.google.com/uc?id=1vDckZ740UU_vCPzcDF1Uaqy-95jQYvAE', email: 'tom@email.com', password: '123456')
second_user = User.create!(name: 'Lilly', user_avatar: 'https://drive.google.com/uc?id=1vDckZ740UU_vCPzcDF1Uaqy-95jQYvAE', email: 'lilly@email.com', password: '123456')
third_user = User.create!(name: 'Luis', user_avatar: 'https://drive.google.com/uc?id=1vDckZ740UU_vCPzcDF1Uaqy-95jQYvAE', email: 'luis@email.com', password: '123456')

# Tom's Categories

first_categ = Category.create!(name: 'Food', icon: 'https://drive.google.com/uc?id=1tvEXRtI0n2mRIyHO6jWTr01CNIFQaHER', author: first_user)
second_categ = Category.create!(name: 'Education', icon: 'https://drive.google.com/uc?id=1Igv3yU_4o3ry6HQzsN6GXhGivGcJ3nrt', author: first_user)
third_categ = Category.create!(name: 'Pet', icon: 'https://drive.google.com/uc?id=13FSBgZOX3uR-CKxz89Rrhu67OcawWgQ5', author: first_user)
fourth_categ = Category.create!(name: 'Health', icon: 'https://drive.google.com/uc?id=1fwwSWOnnOMKvypxTeqWw6pbl-S7SP4J0', author: first_user)

# Lilly Categories

sixth_categ = Category.create!(name: 'Entertainment', icon: 'https://drive.google.com/uc?id=1hDAfXduhiyHl1Wa3jJMXoO5pAm2y25N2', author: second_user)

# Payment

payment1 = Payment.create!(name: 'Udemy NextJs Course', amount: 29.9, author: first_user)
payment2 = Payment.create!(name: 'Udemy Rails Course', amount: 19.9, author: first_user)
second_categ.payments << payment1
second_categ.payments << payment2

payment3 = Payment.create!(name: "Watch Movie", amount: 15, author: second_user)
sixth_categ.payments << payment3

