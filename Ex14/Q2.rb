@students = [] # an empty array accessible to all methods
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students # input the students
    when "2"
      show_students # show the students
    when "3"
      save_students
    when "9"
      exit # programme will terminate
    when "4"
      load_students
    else
      puts "I don't know what you meant. Please try again."
  end
end


def input_students
  puts "Please enter students' required information."
  puts "To finish, just hit return twice."
  # get the first name
  puts "Please enter the name of the first student."
  name = STDIN.gets.delete("\n")
  nationality = "Unknown"

  # while the name is not empty, repeat this code
  while !name.empty? do
    # get cohort
    puts "What cohort is #{name} part of?"
    cohort = STDIN.gets.delete("\n")
    if cohort.empty?
        cohort = :november
    else
        cohort = cohort.downcase.to_sym
    end

    # add the student hash to the array
    add_students(name, cohort = :november)
    @students << {name: name, cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "Please enter another student's name or press enter to finish."
    name = STDIN.gets.delete("\n")
  end
  #return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  if @students != []
    cohort_group = @students.map {|student| student[:cohort]} #creates new array comprised of cohort values from the student hash
      cohort_group.uniq.each do |month| #ignores duplicates in new array
       puts "#{month} cohort:"
       @students.each do |student|
         if student[:cohort] == month
           puts "#{student[:name]}".center(100)
         end
       end
     end
  else
    puts "There are currently no students at Villains Academy :(".center(100)
  end
end

def print_footer
  puts "-------------".center(100)
  if @students.count == 1
    puts "Overall, we have #{@students.count} student"
  else
    puts "Overall, we have #{@students.count} great students!".center(100)
  end

end



def save_students
  # open the file for writing
  file = File.open("/Users/seanblundell/Documents/DevDev/Projects/student-directory/.gitignore/students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first || filename = "/Users/seanblundell/Documents/DevDev/Projects/student-directory/.gitignore/students.csv"# takes file from the command line or uses students.csv as default
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students(filename = "/Users/seanblundell/Documents/DevDev/Projects/student-directory/.gitignore/students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
