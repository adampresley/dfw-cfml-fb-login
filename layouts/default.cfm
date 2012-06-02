<cfoutput><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title><cfif structKeyExists(rc, "title")>#rc.title# // </cfif>CFML Facebook Demo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="" />
	<meta name="author" content="Adam Presley" />

	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
	<style type="text/css">
		body { padding-top: 60px; padding-bottom: 40px; }
	</style>
	<link href="/resources/css/bootstrap-responsive.min.css" rel="stylesheet" />

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="/resources/js/html5.js"></script>
	<![endif]-->
</head>

<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="##">DFW CFML Facebook Login</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="active"><a href="/">Home</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		#body#
		<hr />

		<footer>
			<p>&copy; Adam Presley 2012</p>
		</footer>
	</div>

	<!--- ${jsFiles:start} --->
	<script src="/resources/js/jquery-1.7.1.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/YAOF.js"></script>
	<script src="/resources/js/example-step4.js"></script>

	<cfif structKeyExists(rc, "script")>
		<script type="text/javascript">#rc.script#</script>
	</cfif>
	<!--- ${jsFiles:end} --->
</body>
</html></cfoutput>