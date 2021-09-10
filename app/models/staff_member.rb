class StaffMember < ApplicationRecord
  def password=(raw_password)
    #パスワードが文字列な(kind_of?(String))らハッシュ化、それ以外ならnilを返す
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif
      self.hashed_password = nil
    end
  end
end
