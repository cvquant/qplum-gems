module QplumDataFaker
  class Postcode
    def self.randomize
      Faker::Address.postcode
    end

    def self.anonymize(postcode = nil)
      randomize
    end
  end
end
