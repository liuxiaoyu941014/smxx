class Users::SessionsController < Devise::SessionsController

  ##
  # User login with mobile number
  #
  # Post /sign_in
  #
  # params:
  #   user  - with two attributes :mobile, :code
  #
  # = Examples
  #   
  #   resp = conn.post("/sign_in", {"user" => {"mobile" => '18687878787', "code" => '1234'}})
  #   resp.body
  #   => {}
  #
  #   resp = conn.post("/sign_up", {"user" => {"mobile" => '18688787', "code" => '1235'}})
  #   resp.body
  #   => {error: '验证码错误！'}
  #     
  #   resp = conn.post("/sign_up", {"user" => {"mobile" => 'aaaaaaaaaaa', "code" => '1234'}})
  #   resp.body
  #   => {error: '账号不可用！'}
  #   
  #   resp = conn.post("/sign_in", {"user" => {"name" => 'test',}})
  #   resp.body
  #   => {error: '只支持手机号登录！'}
  # 
  def create
    if params[:user][:mobile]
      login_with_mobile(params[:user][:mobile], params[:user][:code])
    else
      render json: {error: '只支持手机号登录！'}
    end
  end

  private
    ##
    # User login with mobile
    # @param mobile [String] require a mobile number
    # @param code [String] auth code
    # @return [JSON] return json data, if user verification failed, renturn json data with :error option.
    #  
    def login_with_mobile(mobile, code)
      user = User::Mobile.find_by(phone_number: mobile).try(:user)
      if user
        t = Sms::Token.new(mobile)
        if t.valid?(code)
          sign_in user
          render json: {}
        else
          render json: {error: '验证码错误！'}
        end
      else
        render json: {error: '账号不可用！'}
      end
    end
end
