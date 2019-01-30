module QplumDataFaker
  class Token

    def self.randomize
    	Faker::Internet.password(20, 50)
    end

    def self.anonymize(token = nil)
      randomize
    end

  end
end
