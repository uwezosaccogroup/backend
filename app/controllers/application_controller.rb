class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    # user paths
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

      # post and save single user
      post "/users/" do
        user = User.create(
          name: params[:name],
          phone: params[:phone],
          email: params[:email],
          location: params[:location],
          occupation: params[:occupation],
          next_of_kin: params[:next_of_kin],
          next_of_kin_phone: params[:next_of_kin_phone],
          account_type: params[:account_type]
        )
        user.save()
        { "Message": "Created successfully", "Status": "HTTP_200_OK"}.to_json()
      end

      # edit a user
      patch "/users/update/:id" do 
        user = User.find_by(id: params[:id])
    
        if user.update(
          name: params[:name],
          phone: params[:phone],
          email: params[:email],
          location: params[:location],
          occupation: params[:occupation],
          next_of_kin: params[:next_of_kin],
          next_of_kin_phone: params[:next_of_kin_phone],
          account_type: params[:account_type]
        )
          { "Message": "User updated successfully", "Status": "HTTP_200_OK"}.to_json()
        else
        { error: "Failed to update user" }.to_json()
        end
      end

      # delete a user
      delete "/users/:id" do
        user = User.find_by(id: params[:id])
      
        if user
          user.destroy
          { "Message": "User deleted successfully", "Status": "HTTP_200_OK" }.to_json()
        else
          { error: "User not found" }.to_json()
        end
      end

    # savings accounts paths
    
    # current accounts paths


  end
