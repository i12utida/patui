class User < ActiveRecord::Base
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
    validates(:password, presence: true, length: {minimum: 6})
end
