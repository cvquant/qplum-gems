module QplumDataFaker
  class Country
    def self.randomize
      Faker::Address.country
    end

    def self.anonymize(country = nil)
      randomize
    end
  end
end
