context "Filling in the Form" do
  before do
    visit "/new"
  end

  it "can fill in forms for a pirate and two ships" do
    contents = ["Captain Jack Sparrow", "190 lbs", "5 feet 11 inches", "Flying Dutchman", "ghost ship", "gold coins", "Black Pearl", "merchant vessel", "teasure map"]
    fill_in("pirate[name]", :with => contents[0])
    fill_in("pirate[weight]", :with => contents[1])
    fill_in("pirate[height]", :with => contents[2])
    fill_in("ship_name_1", :with => contents[3])
    fill_in("ship_type_1", :with => contents[4])
    fill_in("ship_booty_1", :with => contents[5])
    fill_in("ship_name_2", :with => contents[6])
    fill_in("ship_type_2", :with => contents[7])
    fill_in("ship_booty_2", :with => contents[8])
    click_button('Submit')
    contents.each do |content|
      expect(page).to have_content(content)
    end
  end
end
