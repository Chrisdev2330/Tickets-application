json.extract! ticket, :id, :user_id, :problem, :description, :building_id, :technical_id, :type, :level, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
