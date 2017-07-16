class CancellationPolicy
  attr_reader :name, :refund, :description
  def initialize(name)
    @name = name
    set_refund
    set_description
  end

  private

    def set_refund
      if name == "Flexible"
        @refund = "100%"
      elsif name == "Moderate"
        @refund = "50%"
      else
        @refund = "0%"
      end
    end

    def set_description
      if name == "Flexible"
        @description = "Cancellation policy is flexible with 100% refund with at least 1 week notice."
      elsif name == "Moderate"
        @description = "Cancellation policy is moderate with 50% refund with at least 1 week notice."
      else
        @description = "Cancellation policy is strict with 0% refund once listing is reserved."
      end
    end
end