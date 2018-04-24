module QplumDataFaker
  class Description

    def self.randomize
    	Faker::Lorem.sentence(10)
    end

    def self.anonymize(description = nil)
      randomize
    end

  end
end
