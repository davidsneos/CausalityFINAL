package com.casualtyApp.model

import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.SecurityUtils


class SignupController {

    def index() {
		SecUser user = new SecUser()
		[user: user]
	}
	
	def register(){
		// Check to see if the username already exists
		def user = SecUser.findByUsername(params.username)
		if (user) {
			flash.message = "User already exists '${params.username}'"
			redirect(action:'index')
		}
		
		// User doesn't exist with username. Let's create one
		else {

			// Make sure the passwords match
			if (params.password != params.password2) {
				flash.message = "Passwords do not match"
				redirect(controller: 'auth', action: "index")
			}

			// Passwords match. Let's attempt to save the user
			else {
				// Create user
				user = new SecUser(
						username: params.username,
						passwordHash: new Sha512Hash(params.password).toHex()
				)

				if (user.save()) {

					// Add USER role to new user
					def userRole =  SecRole.findByName('User')
					user.addToRoles(userRole)
					user.save()
					
					
					//save user info in User instance
					
					def userInfo = new User(emailUser:params.email,createdAt: new Date(), 
						isUnalConfirmed:isUnalConfirmed(params.email),shiroUser:user, 
						eventCreator : new EventCreator(), name : params.name, 
						lastName : params.lastname, biography: params.biography, 
						ubication : params.ubication)
					
					userInfo.save()
					
					// Login user
					def authToken = new UsernamePasswordToken(user.username, params.password)
					SecurityUtils.subject.login(authToken)
					
					redirect(controller: 'home', action: 'index' )
				}
				else {
					redirect(controller: 'auth', action: 'index')
				}
			}
		}
		
	}
	
	def loginaux(){
		redirect(controller: 'auth', action: "index", params: params)
	}
	
	/*
	 * Permite establecer si elcorreo suministrado
	 * es unal.edu.co.
	 * 
	 * @author: Felipe
	 */
	def isUnalConfirmed(String email){
		String [] t = email.split("@")
		if( t.length < 2 ) return false
		return t[1].equals("unal.edu.co")
		
	}
	
	
}
