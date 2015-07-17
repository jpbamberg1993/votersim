require './voter'

class Candidate < Voter
  attr_accessor :name, :party, :count_vote

  def initialize(name, party)
    @name       = name
    @party      = party
    @count_vote = 1
  end

  def yell
    puts "Will i print?"
  end

  def give_speech(voters)
    voters.each do |v|
      v.listen(party)
      def stats(voter)
    case @party
    when "Republican"
      if voter.politics.eql?("Libertarian")
        if rand > 0.1
          true
        else
          false
        end
      elsif voter.politics.eql?("Conservative")
        if rand > 0.25
          true
        else
          false
        end
      elsif voter.politics.eql?("Independent")
        if rand > 0.50
          true
        else
          false
        end
      elsif voter.politics.eql?("Progressive")
        if rand > 0.75
          true
        else
          false
        end
      else
        if rand > 0.90
          true
        else
          false
        end
      end
    when "Democrat"
      if voter.politics.eql?("Libertarian")
        if rand < 0.1
          true
        else
          false
        end
      elsif voter.politics.eql?("Conservative")
        if rand < 0.25
          true
        else
          false
        end
      elsif voter.politics.eql?("Independent")
        if rand < 0.50
          true
        else
          false
        end
      elsif voter.politics.eql?("Progressive")
        if rand < 0.75
          true
        else
          false
        end
      else
        if rand < 0.90
          true
        else
          false
        end
      end
    end
  end
end
