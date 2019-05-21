class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def index
    @doses = Dose.all
  end

  # def new
  #   @dose = Dose.new
  # end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = set_cocktail
    @dose.cocktail = set_cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
