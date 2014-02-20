# encoding: UTF-8
# methods to retrieve http header and response
require 'sinatra'
require 'mechanize'

SITE_TITLE = "Split http header and response"
SITE_DESCRIPTION = "'split http header and response"

get '/' do
  erb :index
end

get '/:website' do
  get_header_and_response params[:website]
  erb :index
end

def get_header_and_response(website)
  @agent = Mechanize.new
  @agent.get('http://' + website)
end

error 400..510 do
  'Boom'
end
not_found do
  'This is nowhere to be found.'
end
error do
  'Sorry there was a nasty error - ' + env['sinatra.error'].name
end
