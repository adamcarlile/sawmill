require "ostruct"
require "logger"
require "forwardable"
require "delegate"
require "dry-types"
require "dry-struct"

require "sawmill/version"
require "sawmill/refinements/pluralizer"

require "sawmill/attributes/path"
require "sawmill/attributes/ip"

require "sawmill/types"
require "sawmill/visit"
require "sawmill/page"
require "sawmill/file"

require "sawmill/parsers/tuple"
require "sawmill/parser"

require "sawmill/renderers/text/line"
require "sawmill/renderers/text"
require "sawmill/renderer"

module Sawmill
  module_function

  def logger
    config.logger
  end

  def config
    @config ||= OpenStruct.new.tap do |c|
      c.logger = Logger.new(STDOUT)   
    end
  end

  def configure(&block)
    yield(config)
  end

end
