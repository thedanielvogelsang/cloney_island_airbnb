FactoryGirl.define do
  factory :cancellation do
    name 'Flexible'
    refund 'Full refund 1 day prior to arrival'
    description 
      "The Airbnb service fee is refundable (up to 3 times per year) if the guest cancels before the trip starts. If a guest books a reservation that overlaps with any part of an existing reservation, we won’t refund the Airbnb service fee if they decide to cancel."\
      "Accommodation fees (the total nightly rate you're charged) are refundable in certain circumstances as outlined below."\
      "If there is a complaint from either party, notice must be given to Airbnb within 24 hours of check-in."\
      "Airbnb will mediate when necessary, and has the final say in all disputes."\
      "A reservation is officially canceled when the guest clicks the cancellation button on the cancellation confirmation page, which they can find in Dashboard > Your Trips > Change or Cancel."\
      "Cancellation policies may be superseded by the Guest Refund Policy, extenuating circumstances, or cancellations by Airbnb for any other reason permitted under the Terms of Service. Please review these exceptions."\
      "Applicable taxes will be retained and remitted."
  end
end
