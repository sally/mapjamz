class User < ActiveRecord::Base
  # users.password_hash in the database is a :string

  # validates_presence_of :first_name
  # validates_presence_of :last_name
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  # can change params as needed
  # feel free to refactor this
  def authenticate?(email, txt_password)
    self.email == email && self.password == txt_password
  end

end
