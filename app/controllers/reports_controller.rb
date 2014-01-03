class ReportsController < ApplicationController
  def index
  
  end
  
  def monthly_students
    
  end
  
  def plot_graph_month
     @month = params[:date][:month].to_i
     month_beginning = Date.new(2013, @month, 01)
     month_end = month_beginning.end_of_month
     
     @graph_data = EntryRecord.students_between_days_to_graph(month_beginning, month_end)
  end
  
  def early_students
    
  end
  
  def plot_graph_year
     @year = params[:date][:year].to_i
 
     @graph_data_year = EntryRecord.students_between_months_to_graph(@year)
  end
  
  def hourly_students
    
  end
  
  def plot_graph_hour
     @date = Date.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i) 
     
 
     @graph_data_date = EntryRecord.students_between_hours_to_graph(@date)
  end
end
