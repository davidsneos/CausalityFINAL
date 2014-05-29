
<!DOCTYPE html>
<html>

<!-- para que sirvan los botones desplegables y otras funcinalidades-->
<g:javascript src="jquery-1.11.1.min.js" />
<g:javascript src="bootstrap.min.js" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir:'bootstrap/css', file:'style.css')}" />
<link rel="stylesheet"
	href="${resource(dir:'bootstrap/font-awesome/css', file:'font-awesome.min.css')}" />
<!-- para que no se pixeleen los iconos -->
<meta name="viewport" content="width=device-width, initial-escale=1.0" />
<!-- para que sirva el responsive en todos los dispositivos -->
<title>Causality</title>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-144-precomposed.png')}" />
<!-- para las imagenes iconos -->
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-114-precomposed.png')}" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-72-precomposed.png')}" />
<link rel="apple-touch-icon-precomposed"
	href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-57-precomposed.png')}" />
<link rel="shortcut icon"
	href="${resource(dir:'bootstrap/ico', file:'favicon.png')}" />
</head>

<body>
<body>
	<!-- inicio menu -->
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="#">Causalty</a>
				<ul class="nav">
					<li class="divider-vertical"></li>
				</ul>
				<div class="nav-collapse collapse pull-right">
					<ul class="nav">
						<li></li>
						<li class="divider-vertical"></li>
						<li class="active"><a href="index">Eventos</a></li>
						<li><a href="#about">Grupos</a></li>
						<li><a href="#contact">Contacto</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> ${username}<b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="${createLink(controller:'auth', action:'signOut')}">Cerrar
										sesión</a></li>
								<li class="divider"></li>
								<li class="nav-header">Perfil</li>
								<li><a href="profile">Mi Perfil</a></li>
								<li><a href="#">Configuración</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<!-- Fin menu -->


	<!-- inicio container -->
<body
	onload="initialize('${user}','${username}','${ names}','${desc }')">

	<div class="container">


		





		<div class="span12">&nbsp;</div>
		<div class="span12">&nbsp;</div>
		<div class="row-fluid">
			<div class="span8">
				<div class="page-header">
					<h1>Información de Usuario</h1>
				</div>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span2">
				<ul class="thumbnails">
					<li class="span12"><a href="#" class="thumbnail"> 
					<r:img file="fumaton.png" alt="" />

					</a></li>
				</ul>
				
			</div>
			<div class="span6">
				<div class="well">
					<g:form id = "form1">
					
						<h1>${username}</h1>

						<h3>${user.name} ${user.lastName}</h3>


						<div class="accordion" id="main">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#com1" class="accordion-toggle" data-toggle="collapse"
										data-parent="#main">Mis Eventos</a>
								</div>

								<div id="com1" class="accordion-body collapse">
									<div class="accordion-inner">

										<div class="accordion" id="main2">
											<div class="accordion-group">
												<div class="accordion-heading">
													<a href="#event1" class="accordion-toggle"
														data-toggle="collapse" data-parent="#main2">${names[0]} </a>
														
												</div>
												<div id="event1" class="accordion-body collapse">
													<div class="accordion-inner">${desc[0] }</div>
												</div>
												<div class="accordion-heading">
													<a href="#event2" class="accordion-toggle"
														data-toggle="collapse" data-parent="#main2">${names[1]}</a>
												</div>
												<div id="event2" class="accordion-body collapse">
													<div class="accordion-inner">${desc[1] }</div>
												</div>
												<div class="accordion-heading">
													<a href="#event3" class="accordion-toggle"
														data-toggle="collapse" data-parent="#main2">${names[2]}</a>
												</div>
												<div id="event3" class="accordion-body collapse">
													<div class="accordion-inner">${desc[2] }</div>
												</div>
												<div class="accordion-heading">
													<a href="#event4" class="accordion-toggle"
														data-toggle="collapse" data-parent="#main2">${names[3]}</a>
												</div>
												<div id="event4" class="accordion-body collapse">
													<div class="accordion-inner">${desc[3] }</div>
												</div>
												<div class="accordion-heading">
													<a href="#event5" class="accordion-toggle"
														data-toggle="collapse" data-parent="#main2">${names[4]}</a>
												</div>
												<div id="event5" class="accordion-body collapse">
													<div class="accordion-inner">${desc[4] }</div>
												</div>

											</div>

										</div>


									</div>
								</div>
							</div>
						</div>



						<hr>
						<h3>${user.ubication}</h3>
						
						<blockquote>
			  			<p>${user.biography}</p>
						 <footer> ${user.name} <cite title="Source Title">${user.lastName}</cite></footer>
						</blockquote>
						
						<h3> Eventos Recientes <small> última semana </small></h3>
					</g:form>
					
				</div>
				
				
				
				
				<div class="span5">&nbsp;</div>
			</div>
		</div>


	</div>



	<!-- Fin container -->


	<!-- inicio footer -->
	<footer>
		<div class="row-fluid">
			<div class="span12">&nbsp;</div>

			<div class="span12">
				<p class="pull-right">
					<a href="#">Back to top</a>
				</p>
				<p>
					&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot;
					<a href="#">Terms</a>
				</p>
			</div>
			<div class="span12">&nbsp;</div>

		</div>
	</footer>
	<!-- fin footer -->


</body>

<script>
	$().ready(function() {
		$("a").tooltip({
			placement : "right",

		});

	})
</script>
</html>


