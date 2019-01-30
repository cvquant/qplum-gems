module QplumDataFaker
  class Url

    def self.randomize
    	"http://www.pdf995.com/samples/pdf.pdf"
    end

    def self.anonymize(url = nil)
      randomize
    end

  end
end
