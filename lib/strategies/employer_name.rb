module QplumDataFaker
  class EmployerName
    def self.randomize
      Faker::Company.name
    end

    def self.anonymize(employer_name = nil)
    	randomize
    end
  end
end
