# Create some sample users
User.create(name: "John Doe", email: "john@example.com", password: "password")
User.create(name: "Jane Smith", email: "jane@example.com", password: "password")

# Create some sample categories
Category.create(name: "Food", icon: "🍔")
Category.create(name: "Shopping", icon: "🛍️")
Category.create(name: "Entertainment", icon: "🎬")

# Create some sample transactions
Transaction.create(name: "Lunch at McDonald's", amount: 7.99)
Transaction.create(name: "Groceries at Walmart", amount: 35.78)
Transaction.create(name: "Movie tickets", amount: 12.50)

# Associate transactions with categories
CategoryTransaction.create(category_id: 1, transaction_id: 1)
CategoryTransaction.create(category_id: 2, transaction_id: 2)
CategoryTransaction.create(category_id: 3, transaction_id: 3)
