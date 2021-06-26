struct Callback
  property cb : Lcui::EventCallback

  def initialize(&@cb : Lcui::EventCallback)
  end
end