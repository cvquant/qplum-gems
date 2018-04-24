module QplumDataFaker
  class String
    def self.randomize
      Faker::Name.name
    end

    def self.anonymize(string = nil)
      randomize
    end

  end
end
