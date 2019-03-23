class RequirementsController < ApplicationController
  def index
    @requirements = Requirement.all
  end
  def create
    @requirement = Requirement.new(title: params[:requirement][:title], 
                                  description: params[:requirement][:description]
                                  )
    @requirement.user = current_user
    if @requirement.save
      redirect_to root_path, notice: 'Requerimiento publicado'
    else
      redirect_to root_path, alert: 'Requerimiento no fue pulicado'
    end
    
  end
end
