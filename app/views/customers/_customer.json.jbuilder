json.extract! customer, :id, :user_id, :name, :lastname, :phone, :address, :created_at, :updated_at
json.url customer_url(customer, format: :json)
