class StaticPagesController < ApplicationController
  def welcome
  end

  def details
  end

  def mod_download
    send_file "#{Rails.root}/public/data-exporter_0.1.0.zip"
  end
end
