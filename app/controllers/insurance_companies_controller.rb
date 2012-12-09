# coding: utf-8
class InsuranceCompaniesController < ApplicationController
  
  before_filter :admin_authenticate
  
  # GET /insurance_companies
  # GET /insurance_companies.json
  def index
    @title = "Страховые компании"
    @insurance_companies = InsuranceCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @insurance_companies }
    end
  end

  # GET /insurance_companies/1
  # GET /insurance_companies/1.json
  def show
    @title = "Страховая компания"
    @insurance_company = InsuranceCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @insurance_company }
    end
  end

  # GET /insurance_companies/new
  # GET /insurance_companies/new.json
  def new
    @title = "Добавление страховой компании"
    @insurance_company = InsuranceCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @insurance_company }
    end
  end

  # GET /insurance_companies/1/edit
  def edit
    @title = "Редактирование страховой компании"
    @insurance_company = InsuranceCompany.find(params[:id])
  end

  # POST /insurance_companies
  # POST /insurance_companies.json
  def create
    @insurance_company = InsuranceCompany.new(params[:insurance_company])

    respond_to do |format|
      if @insurance_company.save
        flash[:success] = "Страховая компания успешно добавлена."
        format.html { redirect_to @insurance_company }
        format.json { render json: @insurance_company, status: :created, location: @insurance_company }
      else
        flash.now[:error] = "Страховая компания с таким названием не может быть добавлена!"
        format.html { render action: "new" }
        format.json { render json: @insurance_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /insurance_companies/1
  # PUT /insurance_companies/1.json
  def update
    @insurance_company = InsuranceCompany.find(params[:id])

    respond_to do |format|
      if @insurance_company.update_attributes(params[:insurance_company])
        flash[:success] = "Страховая компания успешно отредактирована."
        format.html { redirect_to @insurance_company }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @insurance_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_companies/1
  # DELETE /insurance_companies/1.json
  def destroy
    @insurance_company = InsuranceCompany.find(params[:id])
    @insurance_company.destroy

    respond_to do |format|
      flash[:success] = "Страховая компания успешно удалена."
      format.html { redirect_to insurance_companies_url }
      format.json { head :no_content }
    end
  end
  
  private    
    def admin_authenticate
      deny_access unless admin?
    end
  
end
