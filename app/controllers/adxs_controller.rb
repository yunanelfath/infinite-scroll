class AdxsController < ApplicationController
  def index
    json_file = File.open(File.join(Rails.root, 'lib','assets','feeds.json'))
    file = File.read(json_file)

    @file = JSON.parse(file)

  end
end
