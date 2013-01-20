# coding: utf-8
class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @title = "Вопросы"
    @sections = Section.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @title = "Вопрос"
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @title = "Добавление вопроса"
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @title = "Редактирование вопроса"
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        flash[:success] = "Вопрос успешно добавлен"
        format.html { redirect_to @question }
        format.json { render json: @question, status: :created, location: @question }
      else
        flash.now[:error] = "Введены некорректные данные"
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:success] = "Вопрос успешно отредактирован"
        format.html { redirect_to @question }
        format.json { head :no_content }
      else
        flash.now[:error] = "Введены некорректные данные"
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      flash[:success] = "Вопрос успешно удален"
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
end
