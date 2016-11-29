class DosesController < ApplicationController

  before_action :find_cocktail, only: [ :new, :create, :destroy ]
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktails_path(@cocktails)
    else
      render :new
  end
  def destroy
    @dose = Cocktail.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path(@cocktails)
  end
  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
