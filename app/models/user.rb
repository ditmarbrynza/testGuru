class User < ApplicationRecord

  devise  :database_authenticatable, # хэширование и сохранение пароля
          :registerable, # регистрация
          :recoverable, # восстановление пароля
          :rememberable, # сохранение сессии между закрытиями браузера
          :validatable, # валидация полей которые учавствуют в аунтефикации
          :confirmable, # подтверждение регистрации пользователя
          :trackable # сохранение статистики по входам пользователя

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test'
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges
  has_many :completed_tests

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: true

  # def completed_tests(level)
  #   tests.where(level: level)
  # end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

end
