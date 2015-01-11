class User < ActiveRecord::Base
	has_many :trainings, dependent: :destroy

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates :email, :password, presence: true
	validates :email, uniqueness: true
	
	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(email, password)
		user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
	
end