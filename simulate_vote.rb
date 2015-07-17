require './candidate.rb'
require './voter.rb'

class Run
  attr_reader :voters, :results

  def initialize(candidates, voters)
    @candidates = candidates
    @voters     = voters
    @results    = results
  end

  def open_vote_booth(voters, candidates)
    @voters.each do |x|
      candidates = Candidate.new
      candidates.stump_speech
    end
  end
  def declaire(candidates)
    candidates.length.max = "Winner!"
  end
end
