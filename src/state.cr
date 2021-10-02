RAW = %({"team_id":"T0CUURR5F","team_name":"Spotlight Data","team_icons":{"image_34":"https://avatars.slack-edge.com/2017-06-09/195324004837_faca10537282ad9ffa8c_34.png","image_44":"https://avatars.slack-edge.com/2017-06-09/195324004837_faca10537282ad9ffa8c_44.png","image_68":"https://avatars.slack-edge.com/2017-06-09/195324004837_faca10537282ad9ffa8c_68.png","image_88":"https://avatars.slack-edge.com/2017-06-09/195324004837_faca10537282ad9ffa8c_88.png","image_102":"https://avatars.slack-edge.com/2017-06-09/195324004837_faca10537282ad9ffa8c_102.png","image_132":"https://avatars.slack-edge.com/2017-06-09/195324004837_faca10537282ad9ffa8c_132.png","image_230":"https://avatars.slack-edge.com/2017-06-09/195324004837_faca10537282ad9ffa8c_230.png"}})

module State
  record WithTeam,
    team : Slack::Team

  record WithLogin,
    token : String

  record Internal,
    auth_state : WithTeam | WithLogin | Nil

  @@internal =
    Lcui::Context(Internal).new(Internal.new(WithTeam.new(Slack::Team.from_json RAW)))

  # @@internal : Lcui::Context(Internal) = Lcui::Context.new(Internal.new(nil))

  def self.get
    @@internal
  end
end
