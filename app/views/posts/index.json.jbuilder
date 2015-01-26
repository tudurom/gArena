json.array!(@posts) do |post|
  json.extract! post, :id, :name, :title, :content, :author_name, :time
  json.url post_url(post, format: :json)
end
