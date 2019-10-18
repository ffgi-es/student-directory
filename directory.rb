# put the students in a list
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]

# print the list of students
puts "The students of Villains Academy"
puts "-------------"
students.each { |student| puts student }

# then print the total number of students
puts "Overall, we have #{students.size} great students"
