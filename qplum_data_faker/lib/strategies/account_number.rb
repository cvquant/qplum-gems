module QplumDataFaker
  class AccountNumber
    def self.anonymize(account_number=nil)
      if account_number.present?
        "QPLUM"+account_number.last(4)
      else
        randomize
      end
    end

    def self.randomize
    	"QPLUM"+Faker::Number.number(4)
    end
  end
end
