class ApplicationController < ActionController::API
    before_action :authorized

    def authorized
        render json: {message: 'Please login to continue'}, status: :unauthorized unless logged_in?
    end

    def encode_token payload
        JWT.encode(payload, secret='s3cr3t')
    end

    def auth_header
        pp request.headers["Authorization"]
        request.headers["Authorization"]
    end

    def decoded_token
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, secret='s3cr3t', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil            
            end
        end 
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            puts user_id
            @user = User.find_by(id: user_id)
        end
    end 

    def logged_in?
        !!current_user
    end

end
