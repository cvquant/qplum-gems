module QplumDataFaker
  class BankName
    def self.randomize
      Faker::Company.name
    end

    def self.anonymize(bank_name = nil)
      Faker::Company.name
    end
  end
end
