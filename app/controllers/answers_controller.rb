class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @interview = Interview.find(params[:interview_id])
    
    @questions = Question.all
    
    q_ids = @questions.map(&:id)
    q_int_ids = @interview.answers.map(&:question_id)

    q_int_ids.each do |q_int|
      unless (q_ids & [q_int]).empty?
        @res = Question.find(q_int)
        @questions = @questions - [@res]
      end
    end
  
    @answer = Answer.new

    respond_to do |format|
      format.html { render :layout => false } # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @interview = Interview.find(params[:interview_id])
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id).content
    
    respond_to do |format|
      format.html { render :layout => false } # edit.html.erb
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    @interview = Interview.find(params[:interview_id])
    @answer = @interview.answers.build(params[:answer])

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @interview }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @interview = Interview.find(params[:interview_id])
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @interview }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @interview = Interview.find(params[:interview_id])
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to @interview }
      format.json { head :no_content }
    end
  end
end
