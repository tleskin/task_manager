require_relative '../test_helper'
require 'pry'

class TaskManagerTest < Minitest::Test

  def create_tasks(num)
    num.times do |x|
      TaskManager.create({ title: "task#{x}",
                           description: "description#{x}"})
    end
  end

  # def test_can_create_a_test_with_an_id
  #   create_tasks(1)
  #   task = TaskManager.find(1)
  #   assert_equal "task0", task.title
  #   assert_equal "description0", task.description
  #   assert_equal 1, task.id
  # end

  def test_it_returns_all_tasks
    create_tasks(2)
    tasks = TaskManager.all
    assert_equal 2, tasks.count
    assert_equal "task0", tasks[0].title
    assert_equal "task1", tasks[1].title
    assert_equal "description0", tasks[0].description
    refute_equal "description2", tasks[1].description
  end

  # def test_it_finds_task_by_id
  #   create_tasks(2)
  #   task = TaskManager.find(1)
  #   assert_equal "task0", task.title
  # end

  # def test_it_updates_task
  #   create_tasks(1)
  #   task = TaskManager.find(1)
  #   assert_equal "task0", task.title
  #   assert_equal 1, task.id
  #   TaskManager.update(1, { title: "task_updated",
  #                           description: "description_updated"} )
  #   task = TaskManager.find(1)
  #   assert_equal "task_updated", task.title
  #   assert_equal "description_updated", task.description
  # end

  # def test_it_creates_tasks_then_destroys_a_task
  #   create_tasks(2)
  #   tasks = TaskManager.all
  #   assert_equal 2, tasks.count
  #   tasks = TaskManager.delete(2)
  #   assert_equal 1, tasks.count
  #   tasks = TaskManager.delete(1)
  #   assert_equal 0, tasks.count
  # end
end
