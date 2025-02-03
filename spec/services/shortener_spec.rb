require "rails_helper"

RSpec.describe Shortener do
    it "Should shortens a given URL to a 7 characters lookup code" do
        url = "https://www.favoritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end

    it "Gives each URL its own lookup code" do
        url = "https://www.favoritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code

        url = "https://www.favoritewebsite.com/articles/how-to-bake"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_2).not_to eq(code_1)
    end

    it "Two equal URLs should have the same lookup code" do
        url = "https://www.favoritewebsite.com"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code

        url = "https://www.favoritewebsite.com"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_2).to eq(code_1)
    end
end
