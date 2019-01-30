module QplumDataFaker
  class Longitude
    def self.randomize
      Faker::Address.longitude
    end

    def self.anonymize(longitude = nil)
      randomize
    end
  end
end
