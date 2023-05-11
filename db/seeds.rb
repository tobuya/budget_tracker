# create some users
user1 = User.new(name: "Johnab", email: "johnab@example.com", password: "password123")
user1.save!
user2 = User.new(name: "Sarahab", email: "sarahab@example.com", password: "password123")
user2.save!

# create some categories for user1
category1 = user1.categories.create(id: 100, name: "Groceries", icon: "🍞")
category1.save!
category2 = user1.categories.create(id: 200, name: "Entertainment", icon: "🎭")
category2.save!


# create some categories for user2
category3 = user2.categories.create(id: 300, name: "Transportation", icon: "🚗")
category3.save!
category4 = user2.categories.create(id: 400, name: "Utilities", icon: "💡")
category4.save!

# create some purchases for user1
purchase1 = user1.purchases.create(name: "Bread", amount: 2.5, category_id: category1.id)
purchase1.save!
purchase2 = user1.purchases.create(name: "Movie ticket", amount: 12.5, category_id: category2.id)
purchase2.save!

# create some purchases for user2
purchase3 = user2.purchases.create(name: "Gasoline", amount: 30.0, category_id: category3.id)
purchase3.save!
purchase4 = user2.purchases.create(name: "Electricity bill", amount: 60.0, category_id: category4.id)
purchase4.save!

# link purchases to categories
category1.purchases << purchase1
category2.purchases << purchase2
category3.purchases << purchase3
category4.purchases << purchase4
