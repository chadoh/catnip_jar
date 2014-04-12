require 'spec_helper'

describe TreatsController do

  describe "#create" do
    it "allows creating a new record and returns json" do
      xhr :post, :create, treat: { site: 'Cat Meanings', username: 'chadoh', cookies: 'whatevs' }

      expect(response.code).to eq "201"
      expect(Treat.first.site).to eq 'Cat Meanings'
    end

    it "updates the 'cookies' field when sent the same site & username again" do
      treat = Treat.create site: 'Cat Meanings', username: 'chadoh', cookies: '1'

      xhr :post, :create, treat: { site: 'Cat Meanings', username: 'chadoh', cookies: '2' }

      expect(response.code).to eq "201"
      expect(Treat.count).to eq 1
      expect(Treat.first.cookies).to eq '2'
    end
  end

end
