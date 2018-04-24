module QplumDataFaker
  class Payload
    def self.randomize
    	{
        :test => "This is a sample payload"
      }.to_json
    end

    def self.anonymize(payload = nil)
      randomize
    end
  end
end
