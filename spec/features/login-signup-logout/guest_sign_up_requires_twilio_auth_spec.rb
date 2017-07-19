require 'rails_helper'

RSpec.describe "Two Factor Authentication" do
  context "allows users to verify their phone" do
    let(:fake_verification_code) { "123456" }

    xit "when they enter their code" do
      allow(CodeGenerator)
        .to receive(:generate)
        .and_return(fake_verification_code)

      traveler = create(:user, verification_code: fake_verification_code)

      allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(traveler)
      current_user = traveler

      visit ("/confirmations/new/")

      expect(page).to have_content("Verification Code")

      expect(page).to have_button("Confirm")

      fill_in "verification_code", with: fake_verification_code
      click_on "Check Validation Code"

      expect(page).to have_content("Verification code is correct!")
    end
  end
end
