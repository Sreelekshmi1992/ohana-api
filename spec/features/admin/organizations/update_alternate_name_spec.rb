require 'rails_helper'

describe 'Update alternate name' do
  before do
    create(:organization)
    login_super_admin
    visit '/admin/organizations/parent-agency'
  end

  it 'with alternate name' do
    fill_in 'organization_alternate_name', with: 'Juvenile Sexual Responsibility Program'
    click_button I18n.t('admin.buttons.save_changes')
    expect(find_field('organization_alternate_name').value).
      to eq 'Juvenile Sexual Responsibility Program'
  end
end
