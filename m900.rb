# coding: utf-8
require 'rubygems'
require 'sinatra'
require 'date'
require 'erb'

helpers do
  def months_since(past_date = Date.today)
    now = Date.today
    (now.month - past_date.month) + 12*(now.year - past_date.year)
  end
end

get '/' do
  erb :index
end

get '/since' do
  begin
    @months = months_since(Date.parse(params[:birthday]))
    erb :since
  rescue
    "出生日期错误，格式应为：1986-1-1(使用减号连接年月日)，请<a href='/'>返回</a>重新输入！"
  end
end

not_found do
  redirect '/'
end
