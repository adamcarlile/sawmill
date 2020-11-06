module Sawmill
  class CLI < Thor
    desc "read FILE", "Read a log file and display the results"
    option :renderer, aliases: :r, 
      enum: Sawmill::Renderer::RENDERERS.keys.map(&:to_s), 
      default: Sawmill::Renderer::DEFAULT_RENDERER,
      desc: "Specify a renderer to display the results"
    option :parser,   aliases: :p, 
      enum: Sawmill::Parser::PARSERS.keys.map(&:to_s),   
      default: Sawmill::Parser::DEFAULT_PARSER,
      desc: "Specify a parser to read the log file"
    def read(file_path)
      parser   = Sawmill::Parser::PARSERS[options[:parser].to_sym]
      file     = Sawmill::File.new(file_path, parser: parser)
      renderer = Sawmill::Renderer::RENDERERS[options[:renderer].to_sym]

      puts renderer.new(file.lines.sort.reverse).to_s
    end
  end
end