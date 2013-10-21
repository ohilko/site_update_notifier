module HttparserHelper
  # include HTTParty
 
  # base_uri "rubygems.org/api/v1"
 
  # attr_accessor :name, :info, :version, :authors, :downloads
 
  # def initialize(name, info, version, authors, downloads)
  #   self.name = name
  #   self.info = info
  #   self.version = version
  #   self.authors = authors
  #   self.downloads = downloads
  # end
 
  # Returns the versions for this particular RemoteGem
  def versions
    # response = self.class.get("/versions/#{name}.json")
    # if response.success?
    #   response
    # else
    #   raise response.response
    # end
  end
 
  # Find a particular gem, based on its name
  def self.find(name)
    # response = get("/gems/#{name}.json")
    # if response.success?
    #   self.new(response["name"], response["info"], response["version"],
    #      response["authors"], response["downloads"])
    # else
    #   # this just raises the net/http response that was raised
    #   raise response.response
    # end
  end
end