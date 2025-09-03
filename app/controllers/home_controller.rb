class HomeController < ApplicationController
  def top
    @book = Book.new
  end

  def about
  end
end
