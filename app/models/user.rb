require 'digest/sha1'

class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test'

  validate :validate_user_email
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  def completed_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def validate_user_email
    self.errors.add(:email_exists, presence: true, message: "Email already exists") if User.find_by(email: self.email).present?
  end

end
