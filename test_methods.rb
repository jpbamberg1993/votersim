# require "./voter.rb"

# def test_voter
#   name = "Sandy"
#   politics = "Progressive"
#   v = Voter.new(name, politics)
#   raise "Wrong name" unless v.name == name
#   raise "Wrong politics" unless v.politics == politics
#   v
# end

# voter = test_voter

# require "./candidate"

# def test_candidate(voter)
#   name = "Mike"
#   party = "Republican"
#   c = Candidate.new(name, party)
#   raise "Wrong name" unless c.name == name
#   raise "Wrong party" unless c.party == party
# end

# def test_campaign
#   campaign = Campaign.new voters, candidates
#   winner = campaign.run
#   puts winner.name, winner.party
# end

# test_candidate(voter)
# Make a person \
class Menu
  
  def initialize
    @candidates = Array.new
    @voters     = Array.new
  end  

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

voters = [
  Voter.new("Amy", "Progressive"),
  Voter.new("Burt","Libertarian"),
  Voter.new("Charlie", "Independent"),
  Voter.new("Darlene", "Conservative"),
  Voter.new("Edgar", "Massachusetts Democrat"),
]

candidates = [
  Candidate.new("Sam", "Republican"),
  Candidate.new("Rebecca", "Democrat"),
  Candidate.new("Theo", "Republican"),
  Candidate.new("Ulrich", "Republican"),
  Candidate.new("Victor", "Republican"),
  Candidate.new("Walter", "Republican")
]

# voters += candidates

# candidates.each do |c|
#   c.votes = c.stump(voters)
# end

# winner = "Test" # The candidate with the most votes

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
end





























