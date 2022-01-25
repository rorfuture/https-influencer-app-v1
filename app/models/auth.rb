class Auth < ApplicationRecord
	def self.omniauth(omniauth_response, user_id)
		if (omniauth_response)
			uid = omniauth_response['uid']
			provider = omniauth_response['provider']
			email = omniauth_response['info'].present? ? omniauth_response['info']['email'] : nil
			name = omniauth_response['info'].present? ? omniauth_response['info']['name'] : nil
			image = omniauth_response['info'].present? ? omniauth_response['info']['image'] : nil
			expires_at = omniauth_response['credentials'].present? ? omniauth_response['credentials']['expires_at'] : nil
			token = omniauth_response['credentials'].present? ? omniauth_response['credentials']['token'] : nil
			auth = Auth.find_or_create_by(provider: provider, uid: uid)
			auth.user_id = user_id
			auth.email = email
			auth.name = name
			auth.image = image
			auth.token = token
			auth.expires_at = expires_at
			return auth
		end

	end

end
