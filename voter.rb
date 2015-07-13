

# A class that will complete person 
class Menu

  def initialize
    @candidates = Array.new
    @voters     = Array.new
  end  

# This methods will determine the will of the user / what there main goal is for the program.
# Passed - Main Action
  def inquire_action
    puts "What would you like to do? (C)reate, (L)ist, (U)pdate, or (V)ote."
    choice = gets.chomp.downcase
    if choice     == "c"
      create_person
    elsif choice  == "l"
      list_characters_created
    elsif choice  == "u"
      update_character
    elsif choice  == "v"
      vote
    else
      error_choice
    end
  end

# Passed - Error information to user
  def error_choice
    begin
      error_choice
    rescue ArgumentError
      puts "Not right"
    rescue Exception => e
      puts "What?"
      puts e.backtrace
      inquire_action
    end
  end

  end

# Make a person 
  def create_person
    print "Enter name: "
    @name = gets.chomp.split.map(&:capitalize).join(' ')
    print "Are you a candidate? T/F:"
    @cand = gets.chomp.downcase
    if @cand == "t"
      @cand = true
    else
      @cand = false
    end
    print "Choose a political party: (D)emocrat or (R)epublican: "
    @party = gets.chomp.downcase
    case @party
    when "d"
      @party = "Democrat"
      print "What are his base politics? -(P)rogressive? -(M)assachusetts Democrat? -(I)ndependent?"
      @politics = gets.chomp.downcase
      case @politics
      when "p"
        @politics = "Progressive"
        print_person        
      when "m"
        @politics = "Massachusetts Democrat"
        print_person
      when "i"
        @politics = "Independent"
        print_person
      else
        error_choice
      end

    when "r"
      @party = "Republican"
      print "What  are his base politics? -(C)onservative? -(L)ibertarian? -(I)ndependent?"
      @politics = gets.chomp.downcase 
      case @politics
      when "c"
        @politics = "Conservative"
        print_person
      when "l"
        @politics = "Libertarian"
        print_person
      when "i"
        @politics = "Independent"
        print_person
      else
        error_choice
      end    
    else
      error_choice
    end
  end

# Print Person
  def print_person
    puts
    sleep 1
    if @cand == true
      puts "Glad you want to serve the public!"  
    else
      puts "Hope you come out to vote!"
    end
    print <<-END 
    Great! We have you registered: 
      Name: #{@name} 
      Party: #{@party} 
      Politics: #{@politics}.
    END
    puts
  end 

# Push to array
  def store_cand_or_voter
    print "Are you a candidate? T/F:"
    @cand = gets.chomp.downcase
    if @cand == "t"
      @cand = true
      @candidates.push(Candidate.new(name, party))
    else
      @cand = false
      @voters.push(Voter.new(name, Party))
    end
  end

require 'tests.rb'
  puts "Candidate"


  def list_characters_created
    if @@choice == "l"
      puts "Candidate: #{candidate}, Voters: #{voter}"
    end
  end

  def update_character
    if @@choice == "u"
      
    end
  end

  def vote 
    if @@choice == "v"
      
    end
  end






























































