class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    # user paths
      # get all users
      get "/users" do
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
        
        if user
          case params[:account_type]
          when "current"
            account = CurrentAccount.create(user_id: user.id,user_name: user.name,balance: "0",account_number: Faker::Number.number(digits: 8),date_of_transaction: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'))
            account.save
          when "savings"
            account = SavingsAccount.create(user_id: user.id,user_name: user.name,balance: "0",account_number: Faker::Number.number(digits: 8),date_of_transaction: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'))
            account.save
          end
          { "Message": "Created successfully", "Status": "HTTP_200_OK"}.to_json()
        else
          { error: "Could not create user" }.to_json()
        end
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
    
      # get the last created user
        get "/users/last" do
            last_user = User.order(created_at: :desc).first
            
          if last_user
              last_user.to_json()
          else
              {error: "No users found"}.to_json()
          end
        end

    # savings-accounts paths
      # get all savings accounts
      get "/savingsaccounts" do
        allsavingsaccounts = SavingsAccount.all
        if allsavingsaccounts
          allsavingsaccounts.to_json()
        else
          { error: "Could not display savings accounts" }.to_json()
        end
      end

      # get a single savings accounts
      get "/savingsaccounts/:id" do
        savingsaccount = SavingsAccount.find_by(id: params[:id])
        if savingsaccount
          savingsaccount.to_json()
        else
          { error: "savingsaccount not found" }.to_json()
        end
      end

      # update and save a single savings account balance

      patch "/savingsaccounts/update/:user_id" do
        savingsaccount = SavingsAccount.find_by(user_id: params[:user_id])

          if savingsaccount.update(
            balance: params[:balance]
          )
          { "Message": "Account updated successfully", "Status": "HTTP_200_OK"}.to_json()
        else
        { error: "Failed to update Account" }.to_json()
        end
      end

      # delete a savings account
      delete "/savingsaccounts/:id" do
        savingsaccount = SavingsAccount.find_by(id: params[:id])
      
        if savingsaccount
          savingsaccount.destroy
          { "Message": "Account deleted successfully", "Status": "HTTP_200_OK" }.to_json()
        else
          { error: "Account not found" }.to_json()
        end
      end


    # current-accounts paths
       # get all current accounts
       get "/currentaccounts" do
        allcurrentaccounts = CurrentAccount.all
        if allcurrentaccounts
          allcurrentaccounts.to_json()
        else
          { error: "Could not display current accounts" }.to_json()
        end
      end

      # get a single current accounts
      get "/currentaccounts/:id" do
        currentaccount = CurrentAccount.find_by(id: params[:id])
        if currentaccount
          currentaccount.to_json()
        else
          { error: "Current account not found" }.to_json()
        end
      end

      # update and save a single current account balance

      patch "/currentaccounts/update/:user_id" do
        currentaccount = CurrentAccount.find_by(user_id: params[:user_id])

          if currentaccount.update(
            balance: params[:balance]
          )
          { "Message": "Account updated successfully", "Status": "HTTP_200_OK"}.to_json()
        else
        { error: "Failed to update Account" }.to_json()
        end
      end

      # delete a current account
      delete "/currentaccounts/:id" do
        currentaccount = CurrentAccount.find_by(id: params[:id])
      
        if currrentaccount
          currentaccount.destroy
          { "Message": "Account deleted successfully", "Status": "HTTP_200_OK" }.to_json()
        else
          { error: "Account not found" }.to_json()
        end
      end


  end
