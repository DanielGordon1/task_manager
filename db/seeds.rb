# Cleaning database
puts "Removing all tasks."
Task.destroy_all

puts "Seeding two tasks"
Task.create!(action: "Visit /about page")
Task.create!(action: "Use Markdown-HTML converter")
