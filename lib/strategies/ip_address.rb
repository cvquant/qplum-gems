module QplumDataFaker
  class IpAddress
    def self.randomize
      Faker::Internet.ip_v6_address
    end

    def self.anonymize(ip_address = nil)
    	randomize
    end
  end
end
