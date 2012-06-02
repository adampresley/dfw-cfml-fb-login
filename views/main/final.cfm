<cfoutput>

	<div class="hero-unit">
		<h1>Hello CFML User Group!</h1>
		<p>
			Press the button below to authenticate with Facebook. Once authenticated
			some information will be put into the DIV below.
		</p>
		<p><button id="btnLogin" class="btn btn-primary btn-large" disabled="disabled">Login!</button></p>
	</div>

	<fieldset id="info" class="hide">
		<legend>Facebook Information</legend>

		<div id="accessToken"></div>
		<div id="id"></div>
		<div id="link"></div>
		<div id="email"></div>
		<div id="firstName"></div>
		<div id="lastName"></div>
		<div id="fullName"></div>
	</fieldset>

	<cfsavecontent variable="rc.script">
		var PageObject = function() {
			var 
				__init = function() {
					/*
					 * First create the login service object. This initializes
					 * all the necesssary scripty stuff.
					 */
					__loginService = new CFMLGroup.Account.LoginService({
						appId: "229453503839103",
						channelUrl: "http://localhost:8080/channel.html"
					});

					$("##btnLogin").click(function() {
						__loginService.facebookLogin();
					});


					/*
					 * Listen for an event stating that we have finished login
					 */
					__this.subscribe("login.facebook.complete", __populateInfo);


					/*
					 * Listen for an event that tells us Facebook is initialized
					 */
					__this.subscribe("init.facebook.complete", function() {
						$("##btnLogin").removeAttr("disabled");
					});
				},

				__populateInfo = function(data) {
					var it;

					for (it in data) {
						if (data.hasOwnProperty(it)) {
							$("##" + it).html(data[it]);
						}
					}

					$("##info").show();
				},


				__this = this,
				__loginService;

			__init();
		};
		YAOF.attach(PageObject);



		$(document).ready(function() {
			new PageObject();
		});
	</cfsavecontent>
</cfoutput>