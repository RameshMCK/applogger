class LogsController < ApplicationController
    
    def index
        
        binding.pry
        
        # logs = Log.all #
        # binding.pry
        # render json: logs
        
        per_page = (params[:pp]) ? params[:pp].to_i : 10
        page = (params[:page]) ? params[:page].to_i : 1
             
     
       render json: {"data": Log.limit(per_page).offset(per_page*(page - 1)).order(:datetime),
                    "total": Log.count}
                    
    end
    
    
    def create
        
        a= Log.create!(params[:log].permit(:uid, :email, :role, :controller,:action, :params, :datetime  ))
        
        ap a
        head :ok
       # binding.pry
        #p params
       #binding.pry 
    end
end