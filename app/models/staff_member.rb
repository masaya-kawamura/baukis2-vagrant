class StaffMember < ApplicationRecord
  has_many :events, class_name: "StaffEvent", dependent: :destroy

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
