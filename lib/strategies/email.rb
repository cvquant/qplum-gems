module QplumDataFaker
  class Email
    def self.anonymize(user_id = nil)
      if user_id.present?
        "user_#{user_id}@testing.com"
      else
        randomize
      end
    end

    def self.randomize
    	Faker::Internet.email
    end
  end
end
