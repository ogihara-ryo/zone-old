json.extract! task, :id, :title, :estimate, :actual, :status, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
