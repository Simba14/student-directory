def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  students.each do |student|
    if student[:name].length < 12 #Condition of student name being less than 12 characters
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    else
      count += 1 # Keeps track of students whose name is 12 characters or longer
    end
  end
  puts "#{count} students' name is 12 characters or longer."
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
