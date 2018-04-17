class User < ApplicationRecord
  has_many :posts, :dependent => :destroy  #при удалении юзера удаляются также все его посты
  mount_uploader :avatar, AvatarUploader    #подрубаем uploader Avatar к модели User
  validates :name, :surname, :email, :nickname,  presence: true #проверка на заполненность полей

  alias_attribute :password_digest, :password_hash
  has_secure_password
  # has_secure password добавляет методы для установки и аутентификации против пароля BCrypt

  def self.generate_token
    SecureRandom.urlsafe_base64
  #   безопасный генератор случайных чисел, который подходит для генерации ключа сеанса в HTTP-файлах cookie
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  #   Класс для вычисления дайджеста сообщений с использованием алгоритма безопасного шифрования SHA-1 NIST
  end

  private

  def create_user_token
    self.remember_token = User.encrypt(User.generate_token)
  end
end
