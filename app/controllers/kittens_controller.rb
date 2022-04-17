class KittensController < ApplicationController
  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to root_path
      flash[:notice] = 'You have successfully created a kitten'
    else
      render :new, status: :unprocessable_entity
      flash.now[:alert] = 'This kitten did not save'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.delete
    redirect_back_or_to root_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten
      flash[:notice] = 'Kitten successfully updated'
    else
      flash.new[:alert] = 'Kitten did not update successfully'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
