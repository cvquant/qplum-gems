module QplumDataFaker
  class Username
    def self.anonymize(id = nil)
      if id.present?
        "user_#{id}"
      else
        randomize
      end
    end

    def self.randomize
    	Faker::Internet.user_name
    end
  end
end
