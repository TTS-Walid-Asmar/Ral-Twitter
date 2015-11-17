class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets
  has_many :relationships

  has_attached_file :avatar, styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>", navpic: "32x32>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/



  has_many :friends, through: :relationships
  has_many :other_relationships, class_name: "Relationship", foreign_key: "friend_id"
  has_many :other_friends, through: :other_relationships, source: :user
  has_many :likes


  def likes?(tweet) #likes? is the name of our method. tweet is the argument.
    tweet.likes.where(user_id: id).any? #Look for the user.id, any? makes the method return true or false.
  end
end
