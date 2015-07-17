require './candidate.rb'
require './simulate_vote.rb'

# Passed - Error information to user
# def error_choice
#
#   begin
#     error_choice
#   rescue ArgumentError
#     puts "Not right"
#   rescue Exception => e
#     puts "What?"
#     puts e.backtrace
#     inquire_action
#   end
#
# end
##########################################################################################################



class MainMenu
  attr_accessor :name, :party, :politics, :voters, :candidates

  def initialiaze
    @voters       = Array.new
    @candidates   = Array.new
  end

# This methods will determine the will of the user / what there main goal is for the program.
  def inquire_action
    puts "What would you like to do? (C)reate, (L)ist, (U)pdate, or (V)ote."
    choice = gets.chomp.downcase
    if choice     == "c"
      create_person_or_politician
    elsif choice  == "l"
      list_characters_created
    elsif choice  == "u"
      update_character
    elsif choice  == "v"
      vote
    else
      puts "That's not a valid input"
      inquire_action
    end
  end

  # Make a person
  def create_person_or_politician
    print "Enter name: "
    name = gets.chomp.split.map(&:capitalize).join(' ')
    print "Choose a political party: (D)emocrat or (R)epublican: "
    party = gets.chomp.downcase
    if party == "d"
      party = "Democrat"
      explain_democrat
    elsif party == "r"
      party = "Republican"
      explain_republican
    else
      puts "That's not valid input"
      create_person_or_politician
    end
  end

  def explain_democrat
    print "What are his base politics? -(P)rogressive? -(M)assachusetts Democrat? -(I)ndependent? "
    politics = gets.chomp.downcase
    case politics
    when "p"
      politics = "Progressive"
      cand_or_voter
    when "m"
      politics = "Massachusetts Democrat"
      cand_or_voter
    when "i"
      politics = "Independent"
      cand_or_voter
    else
      puts "That's not a valid input! Please try again."
      explain_democrat
    end
  end

  def explain_republican
    print "What  are his base politics? -(C)onservative? -(L)ibertarian? -(I)ndependent? "
    politics = gets.chomp.downcase
    case politics
    when "c"
      politics = "Conservative"
      cand_or_voter
    when "l"
      politics = "Libertarian"
      cand_or_voter
    when "i"
      politics = "Independent"
      cand_or_voter
    else
      puts "That's not a valid input! Please try again."
      explain_republican
    end
  end

  # Push to array
  def cand_or_voter
    print "Are you a candidate? T/F: "
    cand = gets.chomp.downcase
    if cand == "t"
      @cand = true
      puts "Glad you want to serve the public!"
      @candidates.push(Candidate.new(name, politics))
    else
      @cand = false
      puts "Hope you come out to vote!"
      @voters.push(Voter.new(name, politics))
    end
    print <<-END
    We have you registered:
      Name:       #{@name}
      Party:      #{@party}
      Politics:   #{@politics}
    END
    puts
  end

  def list_characters_created
    if @candidates
      @candidates.each do |x|
        # puts "Name: #{x.name} Party: #{x.party}"
        puts "Name: #{x.name}"
        puts "Party: #{x.party}"
      end
    elsif @voters
      @voters.each do |x|
        puts "Name: #{x.name}"
        puts "Party: #{x.party}"
      end
    else
      puts "That's not a valid list!"
      # list_characters_created
    end
  end

  def update_character
    puts "Do you want do (e)dit or (d)elete"
    case gets.chomp.downcase
    when "d"
      puts "(C)andidate or (V)oter?"
      case gets.chomp.downcase
      when "c"
        puts "Who do you want to delete?"
        name = gets.chomp
        @candidates.each do |x|
          if x.name == name
            @candidates.delete(x)
          end
        end
      when "v"
        puts "Who do you want to delete?"
        name = gets.chomp
        @voters.each do |x|
          if x.name == name
            @voters.delete(x)
          end
        end
      else
        puts "Try again bud!"
      end
    when "e"
      puts "Is it a (C)andidate or a (V)oter?"
      case gets.chomp.downcase
      when "c"
        puts "Who's name do you want to edit?"
        name = gets.chomp

        @candidates.each do |x|
          if x.name == name
            puts "What do you want to change the name too?"
            new_name = gets.chomp
            x.name = new_name
          end
        end
      when "v"
        puts "Who's name do you want to edit?"
        name = gets.chomp

        @voters.each do |x|
          if x.name == name
            puts "What do you want to change the name too?"
            new_name = gets.chomp
            x.name = new_name
          end
        end
      else
        update
      end
    else
      update
    end
  end

  def vote
    if @candidates.empty? || @voters.empty?
      puts "No one around to vote."
    else
      run = Run.new(@candidates, @voters)
      run.all_stumps
      run.results
      @candidates = Array.new
      @voters     = Array.new
    end
  end

end

class Voter
  attr_accessor :name, :party, :politics, :voted

  def initialize(name, politics)
    @name     = name
    @politics = politics
    @voted    = false
  end

  def listen(candidate)
    puts "I am listening"
    if @voted == false
      if candidate.stump_speech(self)
        puts "#{name} I will not vote for #{candidate.name}."
        @voted = true
      else
        candidate.votes += 1
      end
    else
        puts "#{name}: Go fuck yourself!"
    end
  end
end
