def input_students
  puts "Please enter students' required information."
  puts "To finish, just hit return twice."
  # create an empty array
  students = []
  # get the first name
  puts "Please enter the name of the first student."
  name = gets.chomp
  nationality = "Unknown"


  # while the name is not empty, repeat this code
  while !name.empty? do
    # get cohort
    puts "What cohort is #{name} part of?"
    cohort = gets.chomp
    if cohort.empty?
        cohort = :november
    else
        cohort = cohort.to_sym
    end

    # get nationality
    puts "What is #{name}'s nationality?'"
    nationality = gets.chomp
    # get age
    puts "And how old is #{name}?"
    age = gets.chomp
    begin
    age = Integer(gets.chomp)
    rescue
      puts "That's not a number. Try again"
      retry
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort, nationality: nationality, age: age}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter another student's name or press enter to finish."
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort), #{student[:nationality]}, #{student[:age]} years old".center(100)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students!".center(100)
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
