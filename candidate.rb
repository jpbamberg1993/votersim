require './voter.rb'

class Candidate < CreatePerson
  attr_accessor :name, :party, :count_vote  

  def initialize(name, party)
    @name = name
    @party = party
    @count_vote = 1
  end

  def yell()
  def stump(voters)
    voters.each do |v|
      v.listen(party)
    end
  end

end
  
