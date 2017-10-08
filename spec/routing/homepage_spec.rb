require 'rails_helper'

RSpec.describe "Homepage" do
  it "route root path to course #index" do
    expect(get: "/").to route_to(controller: "courses", action: "index")
  end
end

RSpec.feature "Error Pages" do
  scenario "user views error page" do
    visit "/404"

    expect(page).to have_text("The page you were looking for doesn't exist")
  end
end
