module Sawmill
  class Renderer
    DEFAULT_RENDERER = :text
    RENDERERS = {
      text: Sawmill::Renderers::Text
    }.freeze

    def self.default
      RENDERERS[DEFAULT_RENDERER]
    end
    
  end
end
