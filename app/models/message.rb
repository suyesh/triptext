class Message < ActiveRecord::Base
  validates :phone_number, presence: true
  # TODO scope :queued, -> { where(sent: false)}

  after_save :dispatch

  private

    def dispatch
      self.dispatch_on = Time.now + t_minus_five_minutes(self.drive_time)
      Resque.enqueue_at(self.dispatch_on, DispatchMessage, self.phone_number)
    end

    def t_minus_five_minutes(time)
      ((time - 300) > 0) ? (time - 300) : 0
    end

end
