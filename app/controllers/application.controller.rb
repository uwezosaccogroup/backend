class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    # Add your routes here
  #shows all users
  get "/users" do
    @users = User.all.to_json
  end
#Shows all accounts
  get "/accounts" do
    @account = Account.all.to_json
  end

  post "/users" do
    newuser =  User.create("name":params[:name], "email":params[:email],"phone":params[:phone], "location":params[:location])
    newuser.to_json
   end
end