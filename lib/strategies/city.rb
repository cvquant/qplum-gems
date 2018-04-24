module QplumDataFaker
  class City
    def self.randomize
      Faker::Address.city
    end

    def self.anonymize(city = nil)
      randomize
    end
  end
end
