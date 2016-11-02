class FormulasController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new]

  def index
    @formulas = Formula.all.order('created_at DESC')
  end

  def show
  end

  def new
    @formula = Formula.new
  end

  def create
    @formula = Formula.new(formula_params)
    @formula.user_id = session[:user_id]
    if @formula.save
      redirect_to @formula, notice: 'Recipe added!'
    else
      render :new
      flash.now.alert = 'Invalid entry'
    end
  end

  private

  def find_recipe
    @formula = Formula.find(params[:id])
  end

  def require_login
    unless current_user
      redirect_to root_path, notice: 'You must be logged in.'
    end
  end

  def formula_params
    params.require(:formula).permit(:title, :description, :image)
  end
end
