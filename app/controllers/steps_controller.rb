class StepsController < ApplicationController
  
  def index
    @steps = Step.all
    @steps = @steps.sort_by{|step| step['position']}
  end
  
  def new
    @step = Step.new
  end
  
  def create 
    @step = Step.new(object_params)
    

    
    if @step.save
      redirect_to step_path(@step)
    else
      render 'steps/new'
    end
    
  end
  
  def show
    @step = Step.find(params[:id])
  end
  
  def edit 
    @step = Step.find(params[:id])
  end
  
  def update 
    @step = Step.update(object_params)
    
    redirect_to step_path(@step)
  end
  
  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to steps_path
  end
  
  
  private
  
    def object_params
      params.require(:step).permit(:position, :title, :description, :category)
    end
  
  
end