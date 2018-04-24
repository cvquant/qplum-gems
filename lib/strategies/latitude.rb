module QplumDataFaker
  class Latitude
    def self.randomize
      Faker::Address.latitude
    end

    def self.anonymize(latitude = nil)
      randomize
    end
  end
end
