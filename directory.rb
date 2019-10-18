@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "Select and option:"
  puts "1. input the students"
  puts "2. show the students"
  puts "3. save the list to students.csv"
  puts "9. exit"
  print "[option]: "
end

def process(option) 
  case option
  when "1"
    input_students
  when "2"
    print_header
    print_students
    print_count
  when "3"
    save_students
  when "9"
    exit 0
  else
    print "I don't understand (<Return> to cont.)"
    gets
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"

  # loop until we have finished inputting students
  while true
    # get a name from the user
    name = gets.chomp
    # exit loop if no name is supplied
    break if name.empty?
    @students << {name: name, cohort: :november}
    puts "We have added #{@students.count} students so far"
  end
end

def save_students
  # open the file to write data
  file = File.open("students.csv", "w")
  # write each students data in the file
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  # close the file once finished
  file.close
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]})"}
end

def print_count
  puts "Overall, we have #{@students.size} great students"
end

interactive_menu
