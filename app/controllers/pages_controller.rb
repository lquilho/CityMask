class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @fixpoints = Fixpoint.all
  end
end
