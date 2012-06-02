/*
 * Start with our namespace objects
 */
CFMLGroup = {
	Account: {}
};


/*
 * A simple login service object
 */
CFMLGroup.Account.LoginService = function(config) {
	/*
	 * Executes a Facebook login
	 */
	this.facebookLogin = function() {
		FB.login(function(loginResponse) {
			/*
			 * If the response was successful, get profile information
			 */
			if (loginResponse.status === "connected" && loginResponse.authResponse) {
				console.log("Access token: %s", loginResponse.authResponse.accessToken);

				/*
				 * Get more info about our user
				 */
				FB.api("/me", function(profileResponse) {
					console.log("ID: %s", profileResponse.id);
					console.log("Link: %s", profileResponse.link);
					console.log("Email: %s", profileResponse.email);
					console.log("First name: %s", profileResponse.first_name);
					console.log("Last name: %s", profileResponse.last_name);
					console.log("Full name: %s", profileResponse.name);
				});
			}
			else {
				result.success = false;
			}
		}, { scope: __config.permissions });
	};


	var
		__init = function() {
			__initializeFacebook();
		},

		/*
		 * Initializes the Facebook API, loads the script, etc...
		 */
		__initializeFacebook = function() {
			var
				scriptBlock = null;

			window.fbAsyncInit = function() {
				FB.init({
					appId: __config.appId,
					status: true,
					cookie: true,
					xfbml: true,
					oauth: true,
					channelUrl: __config.channelUrl
				});
			};

			if ($("#" + __config.facebookScriptElId).length) {
				return;
			}

			/*
			 * Inject the Facebook API script
			 */
			scriptBlock = document.createElement("script");
			scriptBlock.id = __config.facebookScriptElId;
			scriptBlock.async = true;
			scriptBlock.src = "//connect.facebook.net/en_US/all.js";

			document.getElementsByTagName("head")[0].appendChild(scriptBlock);
		},


		__this = this,
		__config = $.extend({
			facebookScriptElId: "facebook-jssdk",
			appId: null,
			channelUrl: "channel.html",
			permissions: "email"
		}, config);


	/*
	 * Initialize this service. Basically call our "constructor"
	 */
	__init();
};
