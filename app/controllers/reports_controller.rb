class ReportsController < ApplicationController
  def index
  
  end
  
  def monthly_students
    
  end
  
  def plot_graph
     @month = params[:date][:month].to_i
     month_beginning = Date.new(2013, @month, 01)
     month_end = month_beginning.end_of_month
     
     @graph_data = EntryRecord.students_between_days_to_graph(month_beginning, month_end)
  end
end
