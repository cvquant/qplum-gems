require "slackit/version"
require "slackit/channel"
require "slackit/configuration"
require "slackit/message"
require "slackit/attachment/table"
require "slackit/attachment/mention"
require "slackit/attachment/field"
require "slackit/exception/unknown_channel_exception"

module Slackit
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.setup
    yield(configuration)
  end

  def self.channels
    configuration.channels
  end

  private

  def self.webhook_url
    configuration.webhook_url
  end
end
