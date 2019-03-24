class RequirementsController < ApplicationController
  def index
    @requirements = Requirement.order('title ASC')
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

    def positive
      @requirement = Requirement.find(params[:id])
      @vote = Vote.new
      @vote.value = true
      @vote.user = current_user
      @vote.requirement = @requirement

      if @vote.save
        redirect_to root_path, notice: 'Voto positivo realiazado'
      else
        redirect_to root_path, alert: 'No fue posible votar'
      end
    end

    def negative
      @requirement = Requirement.find(params[:id])
      @vote = Vote.new
      @vote.value = false
      @vote.user = current_user
      @vote.requirement = @requirement

      if @vote.save
        redirect_to root_path, notice: 'Voto negativo realiazado'
      else
        redirect_to root_path, alert: 'No fue posible votar'
      end
    end
    
  end
