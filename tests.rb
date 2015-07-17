require "./voter.rb"
require "./candidate.rb"

def test_voter
  name = "Sandy"
  politics = "Progressive"
  v = Voter.new(name, politics)
  raise "Wrong name" unless v.name == name
  raise "Wrong politics" unless v.politics == politics
  v
end

voter = test_voter

# voter = test_voter
def test_candidate(voter)
  name = "Mike"
  party = "Republican"
  c = Candidate.new(name, party)
  raise "Wrong name" unless c.name == name
  raise "Wrong party" unless c.party == party
end

def test_campaign
  campaign = Campaign.new voters, candidates
  winner = campaign.run
  puts winner.name, winner.party
end

test_candidate(voter)

voters = [
  Voter.new("Amy", "Progressive"),
  Voter.new("Burt","Libertarian"),
  Voter.new("Charlie", "Independent"),
  Voter.new("Darlene", "Conservative"),
  Voter.new("Edgar", "Massachusetts Democrat"),
  Voter.new("Sam", "Republican"),
  Voter.new("Rebecca", "Democrat"),
  Voter.new("Theo", "Republican"),
  Voter.new("Victor", "Republican")
]

candidates = [
  Candidate.new("Ulrich", "Republican"),
  Candidate.new("Walter", "Republican")
]

voters += candidates

# candidates.each do |c|
#   c.votes = c.stump(voters)
# end

winner = "test"# The candidate with the most votes
