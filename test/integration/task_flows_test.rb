require 'test_helper'

class TaskFlowsTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "title", "Tryit"
  end
end
