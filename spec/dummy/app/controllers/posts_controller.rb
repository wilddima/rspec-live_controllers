# frozen_string_literal: true

class PostsController < ApplicationController
  include ActionController::Live

  def index
    (1..5).each do |num|
      response.write(num)
    end
    response.close
  end
end
