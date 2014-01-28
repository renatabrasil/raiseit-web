json.array!(@model_workout_sheets) do |model_workout_sheet|
  json.extract! model_workout_sheet, :name
  json.url model_workout_sheet_url(model_workout_sheet, format: :json)
end
