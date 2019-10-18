@students = []
def students_string
  word = @students.count == 1 ? " student" : " students"
  @students.count.to_s + word
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts
  puts "================================"
  puts
  puts "Select and option:"
  puts "1. input the students"
  puts "2. show the students"
  puts "3. save the list to students.csv"
  puts "4. load the list from student.csv"
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
    puts students_string + " saved to students.csv"
  when "4"
    load_students
    puts "We now have " + students_string
  when "9"
    exit 0
  else
    print "I don't understand"
  end
end

def add_student(name, cohort = :november)
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"

  # loop until we have finished inputting students
  while true
    # get a name from the user
    name = STDIN.gets.chomp
    # exit loop if no name is supplied
    break if name.empty?
    add_student name
    puts "We have " + students_string + " so far"
  end
end

def save_students
  # open the file to write data
  file = File.open("students.csv", "w")
  # write each students data in the file
  @students.each do |student|
    file.puts student_to_csv(student)
  end
  # close the file once finished
  file.close
end

def student_to_csv(student)
  [student[:name], student[:cohort]].join(",")
end

def load_students(filename = "students.csv")
  # open the file to read data
  file = File.open(filename, "r")
  # read each line from file and add it to the student list
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student name, cohort.to_sym
  end
  # close the file
  file.close
end

def try_load_students
  # if a filename isn't supplied, default to students.csv
  filename = ARGV.first.nil? ? "students.csv" : ARGV.first
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded " + students_string + " from #{filename}"
  elsif filename != "students.csv"
    puts "Sorry, #{filename} doesn't exist"
    exit 1
  end
end

def print_header
  puts
  puts "================================="
  puts "The students of Villains Academy"
  puts "---------------------------------"
end

def print_students
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]})"}
end

def print_count
  num, word = students_string.split
  puts
  puts "Overall, we have #{num} great #{word}"
end

try_load_students
interactive_menu
