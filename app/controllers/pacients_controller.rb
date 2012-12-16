# coding: utf-8
class PacientsController < ApplicationController
    
  before_filter :user_authenticate
  
  # GET /pacients
  # GET /pacients.json
  def index
    @title = "Пациенты"
    @pacients = Pacient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pacients }
    end
  end

  # GET /pacients/1
  # GET /pacients/1.json
  def show
    @title = "Пациент"
    @pacient = Pacient.find(params[:id])
    
    if @pacient.address.country_id.nil? || @pacient.address.country_id == ""
      @country = "----------"
    else
      @country = Country.find(@pacient.address.country_id).name
    end
    
    if @pacient.address.region_id.nil? || @pacient.address.region_id == ""
      @region = "----------"
    else
      @region = Region.find(@pacient.address.region_id).name
    end
    
    if @pacient.address.city_id.nil? || @pacient.address.city_id == ""
      @city = "----------"
    else
      @city = City.find(@pacient.address.city_id).name
    end
    
    if @pacient.address.settlement_id.nil? || @pacient.address.settlement_id == ""
      @settlement = "----------"
    else
      @settlement = Settlement.find(@pacient.address.settlement_id).name
    end
    
    if @pacient.address.district_id.nil? || @pacient.address.district_id == ""
      @district = "----------"
    else
      @district = District.find(@pacient.address.district_id).name
    end
    
    if @pacient.address.street_id.nil? || @pacient.address.street_id == ""
      @street = "----------"
    else
      @street = Street.find(@pacient.address.street_id).name
    end
    
    if @pacient.address.house.nil? || @pacient.address.house == ""
      @house = "-----"
    else
      @house = @pacient.address.house
    end
    
    if @pacient.address.flat.nil? || @pacient.address.flat == ""
      @flat = "-----"
    else
      @flat = @pacient.address.flat
    end
    
    if @pacient.policy.insurance_type_id.nil? || @pacient.policy.insurance_type_id == ""
      @itype = "----------"
    else
      @itype = InsuranceType.find(@pacient.policy.insurance_type_id).name
    end
    
    if @pacient.policy.insurance_company_id.nil? || @pacient.policy.insurance_company_id == ""
      @icomp = "----------"
    else
      @icomp = InsuranceCompany.find(@pacient.policy.insurance_company_id).name
    end
    
    if @pacient.policy.number.nil? || @pacient.policy.number == ""
      @pnum = "-----"
    else
      @pnum = @pacient.policy.number
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pacient }
    end
  end

  # GET /pacients/new
  # GET /pacients/new.json
  def new
    @title = "Добавление пациента"
    @pacient = Pacient.new(:sex => true, :birthdate => Date.new(1980, 1, 1))
    @pacient.build_address
    @pacient.build_policy

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pacient }
    end
  end

  # GET /pacients/1/edit
  def edit
    @title = "Редактирование пациента"
    @pacient = Pacient.find(params[:id])
  end

  # POST /pacients
  # POST /pacients.json
  def create
    @pacient = Pacient.new(params[:pacient])
    @pacient.address = Address.new(params[:address])
    @pacient.policy = Policy.new(params[:policy])
    
    respond_to do |format|
      if @pacient.save
        flash[:success] = "Пациент успешно добавлен."
        format.html { redirect_to @pacient }
        format.json { render json: @pacient, status: :created, location: @pacient }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "new" }
        format.json { render json: @pacient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pacients/1
  # PUT /pacients/1.json
  def update
    @pacient = Pacient.find(params[:id])

    respond_to do |format|
      if @pacient.update_attributes(params[:pacient])
        flash[:success] = "Пациент успешно отредактирован."
        format.html { redirect_to @pacient }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "edit" }
        format.json { render json: @pacient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacients/1
  # DELETE /pacients/1.json
  def destroy
    @pacient = Pacient.find(params[:id])
    @pacient.destroy

    respond_to do |format|
      flash[:success] = "Пациент успешно удален."
      format.html { redirect_to pacients_url }
      format.json { head :no_content }
    end
  end
    
  private    
    def user_authenticate
      if admin? || !signed_in?
        deny_access
      end
    end
end
