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

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each { |name| puts name }
end

def print_count(names)
  puts "Overall, we have #{names.size} great students"
end

# print formatted list of names
print_header
print(students)
print_count(students)
