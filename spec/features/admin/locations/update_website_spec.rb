require 'rails_helper'

describe 'Update website' do
  before do
    @location = create(:location)
    login_super_admin
    visit '/admin/locations/vrs-services'
  end

  it 'with invalid website' do
    fill_in 'location_website', with: 'www.monfresh.com'
    click_button I18n.t('admin.buttons.save_changes')
    expect(page).to have_content 'www.monfresh.com is not a valid URL'
    expect(page).to have_css('.field_with_errors')
  end

  it 'with valid website' do
    fill_in 'location_website', with: 'http://codeforamerica.org'
    click_button I18n.t('admin.buttons.save_changes')
    expect(find_field('location_website').value).
      to eq 'http://codeforamerica.org'
  end
end
