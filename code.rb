

# main: This is the main function, where you start the whole program and end it
#
# ARGV[0] - The String that contains a path from your students
# ARGV[1] - The Integer that is the amount of users in one group
# ARGV[2] - The String that contains a path for you output
#
# exmples
#
# main => true
#
# retuns true if code was runned
def main # Arguments is first 3 ARGV inputs
  input = ARGV[0] # Names from a file
  group_size = ARGV[1].to_i # Size of the groups
  output = ARGV[2] # The file that the groups will be written to

  if ARGV[3]
    print "\nToo many argv input\ncode will run anyway\n\n"
  end # checks if your inputs to argv is more than 3

  begin
    begin
      begin
          students = read_students_from_file(input) # This will take all the data (names) from file input

            if group_size < 2 || group_size > students.length - 1
              group_size = 2
            end # Controls the ammount of groups

          random_students = randomize_student_order(students) # This will shuffel the list WITHOUT SHUFFEL WOW!!!
          print_groups_to_file(random_students, group_size, output) # overwrites a file with the groups

      rescue NoMethodError
        print "\nNoMethodError\n"
        exit
      end # Finds the nomethoderrors
    rescue TypeError
      print "\nType Error\n"
      exit
    end # finds the type errors
  rescue Errno::ENOENT
        print "\n Errno::ENOENT \n"
        exit
      end # finds all Errno::ENOENT errors


  return true # Returns true if code was completed
end

# read_students_from_file(): This will convert a txt file into an Array filled with Strings for each row in the txt file
#
# file - The String is a path for a file that you have entered in ARGV[0]
#
# examples:
#
# FILE.txt:
# Adam
# Carl
# Jones
# -----------
#
# read_students_from_file("FILE.txt") => ["Adam","Carl","Jones"]
#
# returns an Array with String elements
def read_students_from_file(file)

  arr = Array.new # This array will contain all names

    File.open(file,"r").each do |line| # an each loop for getting all the data out of the input file to an array
      arr << line.chomp # Chomp chomp chomp
    end


  return arr # returns the list
end

# randomize_student_order(): Will randomize an array
#
# names - The Array that will be randomized
#
# examples:
#
# arr = ["Adam","Carl","Jones"]
# randomize_student_order(arr) => #Randomized# ["Adam","Jones","Carl"]
#
# return The array with the same elements

def randomize_student_order(names)
  arr = names # i prefer the arr var instead of names ^^
  size = arr.length - 1 # Size will contain the maximum index of arr

  i = 0 # loop index
  while i < size # loops the whole list

    x = rand(0..size) # this is the new position for i in arr

    temp = arr[i] #change position
    arr[i] = arr[x] # change position
    arr[x] = temp # change position

    i += 1 # loooooooooooooop

  end
  return arr # Return that array boiii
end

# print_groups_to_file(): Will write groups into a file
#
# names - The Array with randomized values (ARGV[0])
# len - The Integer that is the maximum names in one group (ARGV[1])
# output - The String that will be the output of all groups (ARGV[2])
#
# examples
#
# names = ["Adam","Jones","Carl"]
# len = 2
# output = "FILE.TXT"
# print_groups_to_file(names, len, output) =>
# "FILE.TXT"
#
# Group 1
# Adam
# jones
#
# Group 2
#
# Carl
#
#
# Returns nothing
#
def print_groups_to_file(names, len, output)
  file = File.open(output,"w") # This will save the file that we will write to
  string = "" # This var will hold all names and then it will be written to var file
  arr = names # Still prefer arr before names
  i = 0 # index var
  size = arr.length - 1 # Maximum length of arr
  count = len # count will be the addition to len                  # len is the groups size
  string += "Group 1\n\n"
  group_counter = 2

  while i < size +1  # will loop the whole arr

    string += arr[i] # adds a name to string
    string += "\n" # makes room for next name
    system("cls")
    if i == len -1  # checks if have added the right amount of names in a row to string, if so. make room for the next group
      string += "\nGroup #{group_counter}"
      string += "\n\n" # Makes room
      len += count # add len + count
      group_counter += 1
    end

    i += 1 #looooop
  end

  file.write(string) # overwrite string to output file
  file.close # CLOSING THE FILE!!! bye bye

end


p main
