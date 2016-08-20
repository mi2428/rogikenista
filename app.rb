# encoding: utf-8

require 'sinatra'
require 'sinatra/activerecord'
require './db/models.rb'

set :database_file, 'database.yml'

configure do
  enable :sessions
end

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end

  def username
    session[:identity] ? session[:identity] : 'Guest'
  end
end

get '/' do
  erb :root
end

get '/users' do
  @users = User.order('id DESC')

  erb :users
end

get '/users/:id' do
  @user = User.find(params[:id])
  groups = GroupUser.joins(:group).where(user_id: params[:id]).select('group_users.*, groups.*')
  @groups_active = groups.order('group_users.entrance_date DESC').where(withdrawal_date: nil)
  @groups_inactive = groups.order('group_users.withdrawal_date DESC').where.not(withdrawal_date: nil)
  @charges = Charge.order('charges.inauguration_date DESC').where(user_id: params[:id]).joins(:group).select('charges.*, groups.name AS group_name')
  @contacts = Contact.where(user_id: params[:id]).joins(:contact_tool).select('contacts.*, contact_tools.name AS tool_name, contact_tools.description AS tool_description').order('tool_name')

  erb :user
end

get '/groups' do
  @groups = Group.order('id DESC')

  erb :groups
end

get '/groups/:id' do
  @group = Group.find(params[:id])
  members = GroupUser.joins(:user).where(group_id: params[:id]).select('group_users.*, users.*')
  @members_active = members.order('group_users.entrance_date DESC').where(withdrawal_date: nil)
  @members_inactive = members.order('group_users.withdrawal_date DESC').where.not(withdrawal_date: nil)
  @charges_active = Charge.order('charges.inauguration_date DESC').where(group_id: params[:id], retirement_date: nil).joins(:user).select('charges.*, users.screen_name')

  erb :group
end
