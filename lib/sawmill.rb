require "logger"
require "forwardable"
require "delegate"
require "dry-types"
require "dry-struct"

require "sawmill/version"

require "sawmill/attributes/path"
require "sawmill/attributes/ip"

require "sawmill/types"
require "sawmill/visit"
require "sawmill/page"
require "sawmill/file"

require "sawmill/parsers/tuple"
require "sawmill/parser"

module Sawmill
  module_function

  def logger
    config.logger
  end

  def config
    @config ||= OpenStruct.new.tap do |c|
      c.default_parser = Sawmill::Parser.default
      c.logger         = Logger.new(STDOUT)   
    end
  end

  def configure(&block)
    yield(config)
  end

end
