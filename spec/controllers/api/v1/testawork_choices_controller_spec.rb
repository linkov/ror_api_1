require 'rails_helper'

RSpec.describe Api::V1::TestaworkChoicesController do

  let(:pic1) { Picture.new }
  let(:pic2) { Picture.new }
  let(:pic3) { Picture.new }
  let(:work_user) { User.new }
  let(:user1) { User.new }
  let(:user2) { User.new }
  let(:user3) { User.new }
  let(:choice1) { TestaworkChoice.new }
  let(:choice2) { TestaworkChoice.new }
  let(:choice3) { TestaworkChoice.new }
  let(:work) { Work.new }
  let(:limit_setting) { Setting.new(:code => 'testawork_limit',:value => 3) }
  let(:controller) {Api::V1::TestaworkChoicesController.new}

  before(:example) do

    limit_setting.save

    pic1.save
    pic2.save
    pic3.save

    work.user = work_user
    work.pictures << pic1
    work.pictures << pic2
    work.pictures << pic3
    work.testing = true
    work.save

    user1.save
    user2.save
    user3.save

    controller.stub(:stop_testing)

  end


  it 'should stop testing when one pic receives all choices' do

    choice1.picture = pic1
    choice1.work = work
    choice1.user = user1

    choice2.picture = pic1
    choice2.work = work
    choice2.user = user2

    choice3.picture = pic1
    choice3.work = work
    choice3.user = user3

    choice1.save
    choice2.save
    choice3.save

    expect(controller).to receive(:stop_testing)
    controller.check_testing_state(work)


  end

  it 'should stop testing when one pic receives 1 more choice than others' do

    choice1.picture = pic1
    choice1.work = work
    choice1.user = user1

    choice2.picture = pic2
    choice2.work = work
    choice2.user = user2

    choice3.picture = pic2
    choice3.work = work
    choice3.user = user3

    choice1.save
    choice2.save
    choice3.save

    expect(controller).to receive(:stop_testing)
    controller.check_testing_state(work)

  end

  it 'should not stop testing when pics have equal choices' do

    choice1.picture = pic1
    choice1.work = work
    choice1.user = user1

    choice2.picture = pic2
    choice2.work = work
    choice2.user = user2

    choice3.picture = pic3
    choice3.work = work
    choice3.user = user3

    choice1.save
    choice2.save
    choice3.save

    expect(controller).to_not receive(:stop_testing)
    controller.check_testing_state(work)


  end

end
