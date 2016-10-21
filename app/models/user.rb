class User < ActiveRecord::Base
  # users.password_hash in the database is a :string

  # validates_presence_of :first_name
  # validates_presence_of :last_name
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

  before_save :assign_random_compliment

  def assign_random_compliment
    write_attribute(:compliment, [
      "When my life flashes before my eyes, I hope it's mostly you.",
      "You're the bee's knees, the cat's pyjamas, the pheasant's bowtie.",
      "If we were marooned on an island, I'd be very sad when I had to eat you.",
      "You are more adorable than a baby panda riding on a sneezing piglet.",
      "If you were a dinosaur, you'd be a Legendasaurus Rex.",
      "Is it a bird? Is it a plane? No. It's you, you massive legend.",
      "8 out of 10 cats prefer you.",
      "You're the first person I'd look for after an apocalyptic event.",
      "Things I wish I could be: Ninja. Astronaut. You.",
      "You're better than free wi-fi."
    ].sample)
  end

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
