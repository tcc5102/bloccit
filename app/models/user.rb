class User < ActiveRecord::Base
  has_many :posts

  before_save { self.email = email.downcase if email.present? }
  before_save :format_username

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  def format_username
    if name
      username_array = []
      name.split.each do |each_name|
        username_array << each_name.capitalize
      end

      self.name = username_array.join(" ")
    end
  end
end
