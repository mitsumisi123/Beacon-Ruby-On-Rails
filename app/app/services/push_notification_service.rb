class PushNotificationService

	attr_reader :message, :to,:notification,:options
	require 'fcm'
	def initialize(message = nil, to = nil, notification = nil, options = nil)
    	@message = message
    	@to = to
    	@notification = notification
    	@options = options
	end


	def deliver
		fcm = FCM.new("AAAAj8h95Lc:APA91bEJbyNcf2xej9RGy93TRUeOz3_kNZ_cCJGX-TYiSHycrv-qPymYePxh_RDzsVS3SLqF0uM2hCLbmxmHW3rAMkhL3TnZPJwWbRhao5IrmX8cBB955Hiodh-wPCEXSVN7Mj9Z4FuC")
		message = {
			data: {
				message: self.message,
				sound: 'default'
			},
			notification: {
            	body: self.message,
            	sound: 'default'
          }
		}

		registration_ids = self.to.user_tokens.try(:pluck, :divice_token)

		fcm.send(registration_ids, message) if registration_ids.present?
	end
end