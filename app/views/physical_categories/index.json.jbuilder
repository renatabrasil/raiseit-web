json.array!(@physical_categories) do |physical_category|
  json.extract! physical_category, :name
  json.url physical_category_url(physical_category, format: :json)
end
