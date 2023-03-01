class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    # get all users
    get "/" do
      users = User.all
      if users
        users.to_json()
      else
        { error: "Could not display users" }.to_json()
      end
    end

    # get a single user
    get "/users/:id" do
      user = User.find_by(id: params[:id])
      if user
        user.to_json()
      else
        { error: "User not found" }.to_json()
      end
    end

    # post a single user
    post "/user/" do
      user = User.create(
        name: params[:name],
        phone: params[:phone],
        email: params[:email],
        location: params[:location],
        occupation: params[:occupation],
        next_of_kin: params[:next_of_kin],
        next_of_kin_phone: params[:next_of_kin_phone]
      )
      { "Message": "Created successfully", "Status": "HTTP_200_OK"}.to_json()
    end

  end
