class Post < ApplicationRecord

  belongs_to :user
  has_many :comments

  enum platform: {
    PlayStation4: 0,
    PlayStation5: 1,
    NintendoSwitch: 2,
    Nintendo3DS: 3,
    その他のプラットフォーム: 4
  }

  enum genre: {
    アクション: 0,
    シューティング: 1,
    レーシング: 2,
    ロールプレイング: 3,
    その他のジャンル: 4
  }

end
