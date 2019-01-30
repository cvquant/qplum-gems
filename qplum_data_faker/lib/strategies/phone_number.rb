module QplumDataFaker
  class PhoneNumber
    def self.randomize
      Faker::PhoneNumber.phone_number
    end

    def self.anonymize(phone_number = nil)
    	randomize
    end
  end
end
