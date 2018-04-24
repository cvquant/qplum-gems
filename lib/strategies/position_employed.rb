module QplumDataFaker
  class PositionEmployed
    def self.randomize
      Faker::Job.title
    end

    def self.anonymize(position_employed = nil)
    	randomize
    end
  end
end
