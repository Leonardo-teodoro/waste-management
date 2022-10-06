json.extract! receiver, :id, :name, :email, :condition, :truly_linfo, :cep, :state, :city, :street, :number, :complement, :approved, :link, :created_at, :updated_at
json.url receiver_url(receiver, format: :json)
