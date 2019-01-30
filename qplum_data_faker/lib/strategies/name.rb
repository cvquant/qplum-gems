module QplumDataFaker
  class Name
    def self.anonymize(id)
      if id.present?
        "Test_#{id} User_#{id}"
      else
        randomize
      end
    end

    def self.randomize
    	Faker::Name.name 
    end
  end
end
