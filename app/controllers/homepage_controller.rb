class HomepageController < ApplicationController
  before_filter :authenticate_user, except: [:show]


  def show #displays about page
  end

end
