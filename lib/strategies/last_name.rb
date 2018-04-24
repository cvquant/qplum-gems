module QplumDataFaker
  class LastName
    def self.anonymize(id = nil)
      if id.present?
        "User_#{id}"
      else
        randomize
      end
    end

    def self.randomize
    	Faker::Name.last_name 
    end
  end
end
