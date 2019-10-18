def interactive_menu
  students = []

  loop do
    # print the menu
    puts "Select and option:"
    puts "1. input the students"
    puts "2. show the students"
    puts "9. exit"
    print "[option]: "

    option = gets.chomp

    case option
    when "1"
      students += input_students
    when "2"
      print_header
      print_students(students)
      print_count(students)
    when "9"
      return 0
    else
      print "I don't understand (<Return> to cont.)"
      gets
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"

  # create an empty array
  students = []

  # loop until we have finished inputting students
  while true
    # get a name from the user
    name = gets.chomp
    # exit loop if no name is supplied
    break if name.empty?
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]})"}
end

def print_count(names)
  puts "Overall, we have #{names.size} great students"
end

interactive_menu
