class Adomin::LoginForm
  include ActiveModel::Model

  attr_accessor :email, :password
  # #上記記述で以下2つのメソッドが生成される
  # def email
  #   @email
  # end

  # def email=(value)
  #   @email = value
  # end

end