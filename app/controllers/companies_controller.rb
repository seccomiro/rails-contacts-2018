class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
    # @company.name = "ALGUMA COISA"
  end

  def create
    # render plain: params.inspect


    # name = params[:company][:name]
    # active = params[:company][:active]

    # @company = Company.new
    # @company.name = name
    # @company.active = active
    # @company.save

    # redirect_to @company

    @company = Company.new company_params
    if @company.save
      redirect_to @company
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update company_params
      redirect_to @company
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end

  private

    def company_params
      params.require(:company).permit(:name, :active)
    end

    def set_company
      @company = Company.find params[:id]
    end
  
end