require 'test_helper'

class MomentsControllerTest < ActionController::TestCase
  def setup
    @controller = MomentsController.new
  end

  test 'should get index' do
    moment = Fabricate(:moment)
    get :index
    assert_response :success
    assert_not_nil assigns(:moments)
    assert assigns(:moments).include?(moment)
  end

  test 'should create a new moment' do
    moment = Fabricate(:moment)

    xhr :post, :create, moment: { content: "First Birthday",
                          caption: "Baby's first Birthday",
                          happened_at: Time.now,
                          location: 'Boulder, CO'
                        }

    assert_equal 2, Moment.all.count
  end
end
