module QplumDataFaker
  class FirstName
    def self.anonymize(id = nil)
      if id.present?
        "Test_#{id}"
      else
        randomize
      end
    end

    def self.randomize
    	Faker::Name.first_name 
    end
  end
end
