class AdxsController < ApplicationController
  before_action :set_file, only: [
    :index, :screen
  ]
  def index
  end

  def screen
  end

  def signup
  end

  def signin
  end

  def learn_more
  end
  private

  def set_file
    json_file = File.open(File.join(Rails.root, 'lib','assets','alex-api.json'))
    file = File.read(json_file)

    @file = JSON.parse(file)

  end
end
