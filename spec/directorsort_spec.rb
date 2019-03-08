require 'rails_helper'
RSpec.describe MoviesController, type: :controller do

    describe "POST movies#create Delete movies#destroy" do
      it "should create a new movie and destroy it" do
        #redirect_to '/movies/new'
        post :create, :movie => { :title => "Titanic", :rating => "R", :director => "James Camaron", :release_date => "11/1/1997" }
        expect(Movie.where(:title => "Titanic")).to exist
        @movie = Movie.find_by_title("Titanic")
        delete :destroy, :id => @movie[:id]
        expect(Movie.find_by_title("Titanic")).to be nil
      end
    end
end