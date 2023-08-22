require "rails_helper"

RSpec.describe Genre, type: :model do
  describe "relationships" do
    it { should have_many :movie_genres }
    it { should have_many(:movies).through(:movie_genres) }
  end
end