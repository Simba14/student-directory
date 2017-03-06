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
        cohort = cohort.downcase.to_sym
    end

    # get nationality
    puts "What is #{name}'s nationality?'"
    nationality = gets.chomp
    # get age
    puts "And how old is #{name}?"
    begin
    age = Integer(gets.chomp)
    rescue
      puts "That's not a number. Try again"
      retry
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort, nationality: nationality, age: age}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
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
cohort_group = students.map {|student| student[:cohort]} #creates new array comprised of cohort values from the student hash
     cohort_group.uniq.each do |month| #ignores duplicates in new array
       puts "#{month} cohort:"
       students.each do |student|
         if student[:cohort] == month
           puts "#{student[:name]}, #{student[:nationality]}, #{student[:age]} years old".center(100)
         end
       end
     end
end

def print_footer(students)
  puts "-------------".center(100)
  if students.count == 1
    puts "Overall, we have #{students.count} student"
  else
    puts "Overall, we have #{students.count} great students!".center(100)
  end

end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
