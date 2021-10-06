class StaffMember < ApplicationRecord
  has_many :events, class_name: "StaffEvent", dependent: :destroy

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana, presence: true,
    format: { with: KATAKANA_REGEXP, allow_blank: true }

  def password=(raw_password)
    #パスワードが文字列な(kind_of?(String))らハッシュ化、それ以外ならnilを返す
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif
      self.hashed_password = nil
    end
  end

  def active?
    !suspended? && start_date <= Date.today &&
      (end_date.nil? || end_date > Date.today)
  end
end
