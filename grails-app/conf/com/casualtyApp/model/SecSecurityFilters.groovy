package com.casualtyApp.model

/**
 * Generated by the Shiro plugin. This filters class protects all URLs
 * via access control by convention.
 */
class SecSecurityFilters {
	
	/*
	 * Defines public pages to access, like the signup and auth
	 * @author: Felipe
	 */
	def publicActions = [
		signup: ['*'],
		auth:['*'],
		home:['contact']
	]
	
	/*
	 * If c does not exists returns false, if exists checks if the action
	 * is allowed to be accessed, via find checking if the returned value is
	 * null or not.
	 */
	private boolean findAction(controllerName, actionName){
		def c = publicActions[controllerName]
		return (c) ? c.find{ ( it==actionName||it=='*' ) } != null : false
	}
	
    def filters = {
        all(uri: "/**") {
            before = {
				
				//Check for public controller/actions
				def isPublic=findAction(controllerName,actionName)
				
				if(isPublic) return true
				
                // Ignore direct views (e.g. the default main index page).
                if (!controllerName) return true

                // Access control by convention.
                accessControl()
            }
        }
    }
}
