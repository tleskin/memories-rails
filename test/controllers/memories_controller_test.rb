require 'test_helper'

class MemoriesControllerTest < ActionController::TestCase
  def setup
    @controller = MemoriesController.new
  end

  test 'should get index' do
    moment = Fabricate(:moment)
    get :index
    assert_response :success
  end
end
