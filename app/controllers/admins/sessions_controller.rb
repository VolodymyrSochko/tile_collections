class Admins::SessionsController < Devise::SessionsController
    respond_to :json
  
    def create
      admin = Admin.find_for_database_authentication(email: params[:admin][:email])
  
      if admin && admin.valid_password?(params[:admin][:password])
        sign_in(admin)
        render json: { status: 'success', token: admin.generate_jwt }, status: :created
      else
        render json: { status: 'error', message: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def destroy
      current_admin.jwt_denylist.create(jti: request.headers['Authorization'], exp: Time.now.to_i + 4.hours)
      head :no_content
    end
  end
  