require "./widget"
require "./textview"

module Lcui
  class Button < TextView
    def self.make(text : String? = nil)
      self.new("button", text)
    end
  end
end
