require_relative '../test_helper'

class UserDeletesTaskTest < FeatureTest

  def test_delete_task_title_and_description
    #create data
    TaskManager.create({ title: "Bake cookies",
                         description: "now"})
    # as a guest
    # when I visit the tasks
    visit '/tasks'
    # and I click on edit task
    click_link_or_button("Delete")
    # then I should be on the task index
    assert_equal '/tasks', current_path
    # then I should not see the previous task's title
    refute page.has_content?("Make sugar cookies")
  end

end
