# coding: utf-8
class InterviewsController < ApplicationController
  # GET /interviews
  # GET /interviews.json
  def index
    @title = "Опросные листы"
    @pacients = Pacient.all
    @interviews = Interview.search(params[:search])
    
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
      format.json { render json: @interviews }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    @title = "Опросной лист"
    
    @interview = Interview.find(params[:id])
    answers = @interview.answers
    sections = Section.all
    @result_array = []
    i = 0
    q_int_ids = answers.map(&:question_id)
    sections.each do |section|
      q_sec_ids = section.question_ids
      match = q_sec_ids & q_int_ids
      unless  match.empty?
        questions_int = []
        q_int_for_sec_ids = q_int_ids - (q_int_ids - match)
        sum = 0
        answers.each do |ans|
          unless (q_int_for_sec_ids & [ans.question_id]).empty?
            questions_int << ans
            sum += ans.rating.to_i
          end
        end
        @result_array << [section, questions_int, sum]
        q_int_ids = q_int_ids - match
      end
      i += 1
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/new
  # GET /interviews/new.json
  def new
    @interview = Interview.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/1/edit
  def edit
    @interview = Interview.find(params[:id])
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(params[:interview])

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
        format.json { render json: @interview, status: :created, location: @interview }
      else
        format.html { render action: "new" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interviews/1
  # PUT /interviews/1.json
  def update
    @interview = Interview.find(params[:id])

    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to interviews_url }
      format.json { head :no_content }
    end
  end
end
