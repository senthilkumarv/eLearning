require 'http-access2'
require 'soap/wsdlDriver'

class UsersController < ApplicationController
  def new
  end

  def index
    data = nil
    begin
      users = User.all
      data = { :status => 200, :data => users}
    rescue
      data = { :status => 500, :data => Array.new}
    end
    respond_to do |format|
      format.json  { render :json => data,:except => [:created_at, :updated_at] }
    end
  end
  
  def login
    userName = params[:userName]
    password = params[:password]
    data = nil
    begin
      XSD::Charset.encoding = 'UTF8'
      wsdlfile = "http://192.168.124.9/ADServices/ADWebService.asmx?wsdl"
      driver = SOAP::WSDLDriverFactory.new(wsdlfile).create_rpc_driver('ADWebService', 'ADWebServiceSoap')
      driver.add_method_with_soapaction("ValidateLogin", "http://www.gurusonthego.com/ValidateLogin", "userName", "password")
      result = driver.ValidateLogin(userName, password)
      data = {:status => 200, :data => {:userName => userName, :valid => 1} }
    rescue => err
      data = {:status => 500, :data => {:userName => userName, :valid => 0} }
    end
    respond_to do |format|
      format.json  { render :json => data }
    end
  end
  
  def favorite
    fav = Favorite.new(params[:favorite])
    fav.save
    data = { :status => 200, :data => "Favorite Added Successfully"}
    respond_to do |format|
      format.json  { render :json => data }
    end
  end
end
