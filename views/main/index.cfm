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
	</cfsavecontent>
</cfoutput>