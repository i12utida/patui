require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(gakuseki: 21111, name: "User", email: "user@tokuyama.ac.jp",password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?   #user.rbで定義した制約は初めから適用される
  end
  
  test "gakuseki should be valid" do
    @user.gakuseki = "    "
    assert_not @user.valid?
  end
  
  test "name should be present" do
    @user.name = "  " 
    assert_not  @user.valid?  #user.rbにnameに空白を不可とすると書いたので、返り値はfalseになり、notで反転してtrueになる。
  end
  
  test "email shuld be present" do
    @user.email = "   "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@tokuyama.acjp"
    assert_not @user.valid?
  end
  
  test "gakuseki validation should accept valid numbers" do
    valid_numbers = [12205,32439,12206]
    valid_numbers.each do |valid_number|
      @user.gakuseki = valid_number
      assert @user.valid?, "#{valid_number.inspect} should be valid"
    end
  end
  
  test "gakuseki validation should reject invalid numbers" do
    reject_numbers = [00000000,111111,010101]
    reject_numbers.each do |reject_number|
      @user.gakuseki = reject_number
      assert_not @user.valid?, "#{reject_number.inspect} should be valid"
    end
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@tokuyama.ac.jp i12utida@tokuyama.ac.jp]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid" #.inspectでその要素を出力できる
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "gakuseki should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end