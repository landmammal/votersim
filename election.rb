def voter_multiple_choice(voter_affiliation)





  if voter_affiliation == "l"
    voter_affiliation = "Liberal"
  elsif voter_affiliation == "c"
    voter_affiliation = "Conservative"
  elsif voter_affiliation == "t"
    voter_affiliation = "Tea party"
  elsif voter_affiliation == "s"
    voter_affiliation = "Socialist"
  elsif voter_affiliation == "n"
    voter_affiliation = "Neutral"
  else
    puts "Invalid answer please put the letter in the (paranthesis)"
    puts "PLEASE TRY AGAIN"
    main_menu
    #voter choice and affiliation gets delete it
    voter_name = nil
    voter_affiliation = nil
  end
  return voter_affiliation
end
def politician_party(politician_affiliation)
  if politician_affiliation == "d"
    politician_affiliation = "democrat"
  elsif  politician_affiliation == "r"
    politician_affiliation = "republican"
  else
    puts "Invalid answer please put the letter in the (paranthesis)"
    puts "PLEASE TRY AGAIN"
    main_menu
    #politician name and politician affiliation gets delete it
    politician_affiliation = nil
    politician_name = nil
  end
end

def line_break(space)

    if space =
    puts
    ____________________________________________________________________________

    puts
    end
end




class People
  attr_accessor :name, :affiliation

  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
  end
end


class Politicians < People
end

class Voters < People
end

class World
  #stores all voters and politicians
  def initialize
    @voters = []
    @politicians = []
  end


  #main menu main choice,first thing runnnig when election is ran
  def main_menu
    choice = true
    while choice
      puts "What would you like to do?"
      puts "(C)reate, (L)ist, (U)pdate, (D)elete, or (E)xit "
      options = gets.chomp.downcase

      case options
      when "c"
        # runs method create line 101
        create
      when "l"
        #runs method list line 144
        list
      when "u"
        #runs method update line 161
        update
      when "d"
        #runs method delete line 229
        delete
      when "e"
        choice = false #exits world
      else
        puts "Wrong Input. Please input C, L, U, D or E"
      end
    end
  end


  def create
    # asks user to create voter or politician
    puts "What would you like to create?"
    puts "(V)oter or (P)olitician"
    create_answer = gets.chomp.downcase
    space = space
    line_break(space)
    # checks to see if user wants to create a voter
    if create_answer == "v"
      puts "Enter Voter name: "
      #voter name will be store in voter array in line 60
      voter_name = gets.chomp.downcase

      # asks user to choose voter affiliation
      puts "Enter voter's party affiliation: "
      puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"

      voter_affiliation = gets.chomp.downcase

      #creates a voter(s) and passes voter name and affiliation ..
      @voters << Voters.new(voter_name, voter_multiple_choice(voter_affiliation)) #voter name and affiliation gets save to voter array together
      puts "New voter add it"

      # runs if user decides to make a politician
    elsif create_answer == "p"
      puts "Enter politicians name: "
      #gets politician name and stores it
      politician_name = gets.chomp.downcase

      # asks user to choose politicians party
      puts "Enter politician's party: "
      puts "(R)epublican or (D)emocrat"
      politician_affiliation = gets.chomp.downcase
      #politician party choices and assigment

      #creates new politician with the name assign on line 68 and party from line 73
      @politicians << Politicians.new(politician_name, politician_party(politician_affiliation))
    else
      "Invalid answer please put the letter in the (paranthesis)"
      create
    end


  end

  def list
    # displays list of voters
    puts "Here is the list of voters: "
    @voters.each do |n|

      puts "Name: #{n.name}" + " " + "Affiliation: #{n.affiliation}"

    end

    # displays list of politicians
    puts "Here is the list of politicians: "
    @politicians.each do |n|

      puts "Name: #{n.name}" + " " +"Affiliation: #{n.affiliation}"
    end
  end

  def update
    puts "What would you like to update"
    puts "(V)oter or (P)olitician"
    create_answer = gets.chomp.downcase

    if create_answer == "v"
      create_answer = "voter"
    elsif create_answer == "p"
      create_answer = "politician"
    else
      "Invalid answer please put the letter in the (paranthesis)"
      update
    end

    case create_answer
    when "voter"
      list

      match = false
      puts "Which voter would you like to update?"
      user_update = gets.chomp.downcase

      # loops over voters. if match is found then asks for affiliation update
      @voters.each do |instance|
        if instance.name == user_update
          puts "Update #{user_update} to: "
          puts "Liberal, Conservative, Tea Party, Socialist, Neutral"
          affiliation_update = gets.chomp.downcase
          # updates the voters affiliation choice
          instance.affiliation = voter_multiple_choice(affiliation_update)
          puts "#{user_update} has been updated to #{voter_multiple_choice(affiliation_update)}"
          match = true
        end
      end
      if match != true
        puts "Person not found.  Returning to main menu."
        main_menu
      end
    when "politician"
      list

      match = false
      puts "Which politician would you like to update?"
      user_update = gets.chomp.downcase

      # loops over voters. if match is found then asks for affiliation update
      @politicians.each do |instance|
        if instance.name == user_update
          puts "Update #{user_update} to: "
          puts "(R)epublican or (D)emocrat"
          affiliation_update = gets.chomp.downcase
          # updates the voters affiliation choice
          instance.affiliation = politician_party(affiliation_update)
          puts "#{user_update} has been updated to #{politician_party(affiliation_update)}"
          # updates the voters affiliation choice
          # instance.affiliation = affiliation_update
          # puts "#{user_update} has been updated to #{affiliation_update}"
          match = true
        end
      end
      if match != true
        puts "Person not found.  Returning to main menu."
        main_menu
      end
    end

  end

  def delete
    list
    puts "Would you like to delete a (V)oter or a (P)olitician"
    create_answer = gets.chomp.downcase
    #add choice for v or p

    case create_answer
    when "v"
      puts "Which voter would you like to delete?"
      voter_delete = gets.chomp.downcase
      #runs thru each voter
      @voters.each do |instance|
        if instance.name == voter_delete
          puts "Are you sure you wish to delete #{voter_delete}? (Y/N)"
          user_answer = gets.chomp.downcase
          if user_answer == "y"
            #deletes the instance containing the .name  & .affiliation
            @voters.delete(instance)
            puts "You have removed #{voter_delete}"
          else user_answer == "n"
            puts "Returning you to the main menu"
            main_menu
          end
        end #could i have put else in here????????????????
        puts "Did not recognize input, returning to main menu."
        main_menu
      end
    when "p"
      list
      puts "Which politician would you like to delete?"
      politician_delete = gets.chomp.downcase
      runs thru each politician
      @politicians.each do |instance|
        if instance.name == politician_delete
          puts "Are you sure wish to delete #{politician_delete}? (Y/N)"
          user_answer = gets.chomp.downcase
          if user_answer == "y"
            #deletes the instance containing the .name  & .affiliation
            @politicians.delete(instance)
            puts "You have removed #{politician_delete}"
          elsif user_answer == "n"
            puts "Returning you to the main menu"
            main_menu
          end
        end
      end
    end
  end

end
my_world = World.new
my_world.main_menu



# when "voter"
#   puts "Which voter would you like to update?"
#   # list
#   user_update = gets.chomp.downcase
#   p 'TESTTESTSETSET'
#   # @voters.each do |instance|
#   if instance.name.downcase == user_update
#     puts "Update #{user_update} to: "
#     puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
#
#     affiliation_update = gets.chomp.downcase

# if affiliation_update == "l"
#   affiliation_update = "Liberal"
# elsif affiliation_update == "c"
#   affiliation_update = "Conservative"
# elsif affiliation_update == "t"
#   affiliation_update = "Tea party"
# elsif affiliation_update == "s"
#   affiliation_update = "Socialist"
# elsif affiliation_update == "n"
#   affiliation_update = "Neutral"
# else
#   puts "Invalid answer please put the letter in the (paranthesis)"
# end
#
#     instance.affiliation = affiliation_update
#     puts "Updated #{user_update} to #{affiliation_update}"
#   end
# end
# puts "Person not found.  Returning to main menu."
# main_menu
# end
# # def update
#   puts "Who would you like to update?"
#   list
#   create_answer = gets.chomp.downcase
#
#   if create_answer == @politicians.each do |n|
#     puts "What wound you like #{n.name} to be change to?"
#     update_name = gets.chomp
#     n.name = update_name
#
#     puts "What's the #{n.name} party?"
#     puts "(R)epublican or (D)emocrat"
#     update_affiliation = gets.chomp.downcase
#
#     if update_affiliation == "d"
#       update_affiliation = "democrat"
#     elsif  update_affiliation == "r"
#       update_affiliation = "republican"
#     else
#       puts "Invalid answer please put the letter in the (paranthesis)"
#       puts "PLEASE TRY AGAIN"
#       update
#     end
#     update_affiliation = n.affiliation
#   end
