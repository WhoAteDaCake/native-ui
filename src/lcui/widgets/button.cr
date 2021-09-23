require "./widget"
require "./textview"

module Lcui
  class Button < TextView
    def self.make(text : String, **opts)
      self.new(parse("button", text, **opts))
    end
  end
end
