class KittensController < ApplicationController

  def show
    @kitten = Kitten.find(params[:id])
  end
    
  def index
    @kittens = Kitten.all
  end
    
  def new
    @kitten = Kitten.new
  end
    
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: "Kitten created succeessfully"
    else  
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Kitten Updated successfully"
    else 
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      redirect_to kittens_path, notice: "Kitten was successfully Killed"
    else 
      redirect_to @kitten, alert: "Kitten survived"
    end
  end


  private

  def kitten_params 
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
