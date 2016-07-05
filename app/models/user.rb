class User < ActiveRecord::Base
    has_many :questionnaires, dependent: :destroy
    attr_accessor :remember_token
    before_save { self.email = email.downcase}
    
    #gakusekiは数字5つの場合のみ許可する
    VALID_GAKUSEKI_REGEX = /\A[\d]{5}\z/
    validates(:gakuseki, presence: true, length: {is: 5}, format: {with: VALID_GAKUSEKI_REGEX}, uniqueness: true)
    
    #nameの空白を不可、長さは50以下とする
    validates(:name, presence: true, length: {maximum: 50})
    
    #emailの空白を不可、長さは100以下、末尾はtokuyama.ac.jpとする
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@tokuyama+\.ac+\.jp+\z/
    validates(:email, presence: true, length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
)

    has_secure_password
    
    #passwordの空白を不可、長さは6文字以上
    validates(:password, presence: true, length: {minimum: 6}, allow_nil: true)
    
    # 与えられた文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
    
     # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # 永続的セッションで使用するユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # ユーザーログインを破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end
