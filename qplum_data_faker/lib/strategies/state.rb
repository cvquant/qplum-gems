module QplumDataFaker
  class State
    def self.randomize
      Faker::Address.state
    end

    def self.anonymize(state)
      randomize
    end
  end
end
