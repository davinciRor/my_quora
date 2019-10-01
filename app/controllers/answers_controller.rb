# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy update]
  before_action :find_question, only: [:create]
  before_action :find_answer, only: %i[update destroy make_best]

  authorize_resource

  respond_to :js

  def create
    respond_with(@answer = @question.answers.create(answer_params.merge(user: current_user)))
  end

  def update
    respond_with(@answer.update(answer_params))
  end

  def destroy
    respond_with(@answer.destroy)
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def publish_answer
    ActionCable.server.broadcast(
      "answers_for_question_#{params[:question_id]}",
      answer: @answer.as_json(include: :attachments).merge(rating: @answer.rating).to_json
    )
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: %i[file _destroy])
  end
end
