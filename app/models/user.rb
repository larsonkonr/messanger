class User < ActiveRecord::Base
  has_many :conversations, :foreign_key => :sender_id
  after_create :create_default_conversation
  
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.email     = auth.info.email
    user.nickname  = auth.info.nickname
    user.image_url = auth.info.image
    user.token     = auth.credentials.token
    user.save

    user
  end


  private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end
end
