# require 'rails_helper'
#
# RSpec.describe Api::V1::QuestionsController do
#
#   let(:pic1) { Picture.new }
#   let(:pic2) { Picture.new }
#   let(:user) { User.new }
#   let(:question) { Question.new }
#   let(:non_user_work) { Work.new }
#   let(:user_work) { Work.new }
#   let(:package) { Package.new }
#   let(:questions_controller) {Api::V1::QuestionsController.new}
#
#
#   let(:single_phrasing) {Phrasing.new(:code => 'single')}
#   let(:uni_phrasing) {Phrasing.new(:code => 'universal')}
#   let(:multi_phrasing) {Phrasing.new(:code => 'multiple')}
#
#
#   before(:example) do
#
#
#     pic1.save
#     pic2.save
#
#     user.email = 'user@user.com'
#     user.save
#
#     package.save
#
#
#     user_work.user = user
#     user_work.packages << package
#     user_work.questions << question
#     user_work.save
#
#     question.package = package
#     question.active = true
#     question.save
#
#     non_user_work.packages << package
#     non_user_work.questions << question
#     non_user_work.save
#
#     single_phrasing.save
#     uni_phrasing.save
#     multi_phrasing.save
#
#     questions_controller.instance_variable_set(:@current_work, user_work)
#     allow(questions_controller).to receive(:current_user) { user }
#
#   end
#
#
#   it 'should not return answered questions for work and user' do
#
#
#     rate = Rating.new
#     rate.author = user
#     rate.work = non_user_work
#     rate.question = question
#     rate.save
#
#     unanswered_questions = questions_controller.unanswered_questions(non_user_work,user)
#     expect(unanswered_questions).to be_empty
#   end
#
#   it 'should return unanswered questions for work and user' do
#
#     unanswered_questions = questions_controller.unanswered_questions(non_user_work,user)
#     expect(unanswered_questions).not_to be_empty
#   end
#
#   it 'should return single Phrasing questions for project with 1 picture' do
#
#     question.phrasing_id = single_phrasing.id
#     question.save
#
#     user_work.pictures << pic1
#     user_work.save
#
#     next_question = questions_controller.next_question_skip_rate_type()
#     expect(next_question).not_to be_nil
#
#     user_work.pictures << pic2
#     user_work.save
#
#     next_question = questions_controller.next_question_skip_rate_type()
#     expect(next_question).to be_nil
#
#
#   end
#
#   it 'should return multi Phrasing questions for project with more than 1 picture' do
#
#     question.phrasing_id = multi_phrasing.id
#     question.save
#
#     user_work.pictures << pic1
#     user_work.save
#
#     next_question = questions_controller.next_question_skip_rate_type()
#     expect(next_question).to be_nil
#
#     user_work.pictures << pic2
#     user_work.save
#
#     next_question = questions_controller.next_question_skip_rate_type()
#     expect(next_question).not_to be_nil
#
#
#   end
#
#
# end
