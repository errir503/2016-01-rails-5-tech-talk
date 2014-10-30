# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature Secret, :devise do
  scenario 'user can sign in via helper' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit '/secrets'
    expect(page).to have_content 'Listing secrets'

    build(:funny_secret)
  end

  scenario 'user can sign in via warden' do
    include Warden::Test::Helpers
    Warden.test_mode!

    user = FactoryGirl.build(:user)
    login_as(user, scope: :user)

    visit '/secrets'
    expect(page).to have_content 'Listing secrets '
  end
end