module QplumDataFaker
  class StreetName
    def self.randomize
      Faker::Address.street_name
    end

    def self.anonymize(street_name = nil)
      randomize
    end
  end
end
