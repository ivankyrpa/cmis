# coding: utf-8
class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.json
  def index
    @title = "Обследования"
    @pacients = Pacient.order("lastname")
    @groups = Group.find_all_by_user_type_id(current_user.user_type_id)
    ids_characteristics = []
    @surveys = []
    @surveys_init = Survey.search(params[:search])
    
    if lymph?
      @groups.each do |group|
        group.characteristics.each do |charact|
          ids_characteristics.push(charact.id)
        end
      end
      @surveys_init.each do |survey|
        arr = []
        if (survey.characteristics_surveys.length != 0)
          arr.push(survey.characteristics_surveys.first.characteristic_id)
          if (ids_characteristics & arr).empty? 
            @surveys
          else
            @surveys.push(survey)
          end
        else
          @surveys.push(survey)
        end
      end
    else
      if phleb?
        @groups.each do |group|
          group.f_characteristics.each do |charact|
            ids_characteristics.push(charact.id)
          end
        end
        @surveys_init.each do |survey|
          arr = []
          if (survey.characteristics_surveys.length != 0)
            arr.push(survey.characteristics_surveys.first.f_characteristic_id)
            if (ids_characteristics & arr).empty? 
              @surveys
            else
              @surveys.push(survey)
            end
          else
            @surveys.push(survey)
          end
        end
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
      format.json { render json: @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @title = "Обследование"
    @survey = Survey.find(params[:id])
    characteristics_sur = @survey.characteristics_surveys
    groups = Group.find_all_by_user_type_id(current_user.user_type_id)
    @result_array = []
    i = 0
    @arr_tr = [[],[],[]]
    if lymph?
      # Отображение информации о лимфатических обследованиях
      ch_sur_ids = characteristics_sur.map(&:characteristic_id)
      ind_for_diagram = 0
      groups.each do |group|
        ch_gr_ids = group.characteristic_ids
        match = ch_gr_ids & ch_sur_ids
        @arr_tr[i][0] = 0
        @arr_tr[i][1] = 0
        @arr_tr[i][2] = ch_gr_ids.length
        unless  match.empty?
          #@oper = 0
          #@cons = 0
          #@resur = ch_gr_ids.length
          characts_sur = []
          ch_sur_for_gr_ids = ch_sur_ids - (ch_sur_ids - match)
          characteristics_sur.each do |ch|
            unless (ch_sur_for_gr_ids & [ch.characteristic_id]).empty?
              characts_sur << ch
              case ch.result
                when 1
                  @arr_tr[i][0] += 1 
                  #@oper = @oper + 1
                when 2
                  @arr_tr[i][1] += 1
                  #@cons = @cons + 1
                else
              end
            end
          end
          @arr_tr[i][2] = @arr_tr[i][2] - (@arr_tr[i][0] + @arr_tr[i][1])
          #@resur = @resur - @oper - @cons
          if (@arr_tr[i][0] != 0 || @arr_tr[i][1] != 0)
            ind_for_diagram = i
          end
          @result_array << [group, characts_sur]
          ch_sur_ids = ch_sur_ids - match
        end
        i += 1
      end
    else
      if phleb?
        # Отображение информации о венозных обследованиях
        ch_sur_ids = characteristics_sur.map(&:f_characteristic_id)
        ind_for_diagram = 0
        groups.each do |group|
          ch_gr_ids = group.f_characteristic_ids
          match = ch_gr_ids & ch_sur_ids
          @arr_tr[i][0] = 0
          @arr_tr[i][1] = 0
          @arr_tr[i][2] = 0
          unless  match.empty?
            #@oper = 0
            #@cons = 0
            #@resur = ch_gr_ids.length
            characts_sur = []
            ch_sur_for_gr_ids = ch_sur_ids - (ch_sur_ids - match)
            characteristics_sur.each do |ch|
              unless (ch_sur_for_gr_ids & [ch.f_characteristic_id]).empty?
                characts_sur << ch
                case ch.result
                  when 1
                    @arr_tr[i][0] += 1
                    #@oper = @oper + 1
                  when 2
                    @arr_tr[i][1] += 1
                    #@cons = @cons + 1
                  when 3
                    @arr_tr[i][2] += 1
                  else
                end
              end
            end
            #@resur = @resur - @oper - @cons
            if @arr_tr[i][0] != 0 || @arr_tr[i][1] != 0 || @arr_tr[i][2] != 0 
              ind_for_diagram = i
            end 
            @result_array << [group, characts_sur]
            ch_sur_ids = ch_sur_ids - match
          end
          i += 1
        end
      end
    end
    
    
    #gon.oper = @oper
    #gon.cons = @cons
    #gon.resur = @resur
    
    a = outRecom(@arr_tr)
    
    gon.arr = @arr_tr[ind_for_diagram]
    
    @first_level = a[0]
    @second_level = a[1]
    @third_level = a[2]

    # Количество характеристик для обследования
    @characteristics_for_sur = []
    groups.each do |group|
      if lymph?
        @characteristics_for_sur += group.characteristics
      else
        if phleb?
          @characteristics_for_sur += group.f_characteristics
        end
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey }
    end
  end
  
  def outRecom(array)
    groups = Group.find_all_by_user_type_id(current_user.user_type_id)
    recom_arr = []
    i = 0
    if lymph?
      groups.each do |group|
        rec = group.l_recommendations.first
        ind_max = array[i].index(array[i].max)
        if (ind_max == 0)
          recom_arr[i] = rec.content_o
        else
          if (ind_max == 1)
            recom_arr[i] = rec.content_c
          else  
            recom_arr[i] = rec.content_d
          end
        end
        i += 1
      end
    else
      if phleb?
        groups.each do |group|
          level = array[i]
          all_chars = group.f_characteristics.length
          if (all_chars != 0)
            perc_c = (level[0] / all_chars)*100
            perc_dc = (level[2] / all_chars)*100
            found = false
            group.f_recommendations.each do |f_char|
              unless found
                if (!f_char.low_c.nil? && !f_char.high_c.nil?) &&
                    (!f_char.low_dc.nil? && !f_char.high_dc.nil?) 
                  #В случае 2 диапазонов рекомендации
                  if (perc_c >= f_char.low_c) && (perc_c <= f_char.high_c) &&
                      (perc_dc >= f_char.low_dc) && (perc_dc <= f_char.high_dc)
                    found = true
                    recom_arr[i] = f_char.content
                  else
                    recom_arr[i] = "Необходимо дообследование"
                  end  
                else
                  if (!f_char.low_c.nil? && !f_char.high_c.nil?)  
                    #В случае диапазона компенсации в рекомендации
                    if (perc_c >= f_char.low_c) && (perc_c <= f_char.high_c) 
                      found = true
                      recom_arr[i] = f_char.content
                    else
                      recom_arr[i] = "Необходимо дообследование"
                    end  
                  else 
                    if (!f_char.low_dc.nil? && !f_char.high_dc.nil?)
                      #В случае диапазона декомпенсации в рекомендации
                      if (perc_dc >= f_char.low_dc) && (perc_dc <= f_char.high_dc)
                        found = true
                        recom_arr[i] = f_char.content
                      else
                        recom_arr[i] = "Необходимо дообследование"
                      end  
                    else 
                      recom_arr[i] = "Необходимо дообследование"
                    end
                  end   
                end
              end
            end
          end
          op = level[1] + level[2]
          con = level[0]
          res = all_chars - (level[0] + level[1] + level[2])
          @arr_tr[i] = [op, con, res]          
          i += 1
        end
      end
    end 
    return recom_arr    
  end

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @title = "Добавление обследования"
    @survey = Survey.new(:survey_date => Date.today)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        flash[:success] = "Обследование успешно добавлено."
        format.html { redirect_to @survey }
        format.json { render json: @survey, status: :created, location: @survey }
      else
        flash.now[:error] = "Введены неверные данные!"
        format.html { render action: "new" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    @survey = Survey.find(params[:id])
    @characteristics_sur = @survey.characteristics_surveys
    @survey.characteristics_surveys.build(params[:survey][:characteristics_survey])
    
    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        flash[:success] = "Обследование успешно отредактировано."
        format.html { redirect_to @survey }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены неверные данные!"
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      flash[:success] = "Обследование успешно удалено."
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end

end
