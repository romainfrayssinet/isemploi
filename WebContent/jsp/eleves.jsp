<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	
		<strong> Eleves</strong>
		
		test
		
		<c:forEach var = "eleve" items = "${eleves}">
			<p>
				<c:out value = "${eleve.id }" />
				<c:out value = "${eleve.prenom}" />
				<c:out value = "${eleve.nom}" />
			</p>
		</c:forEach>
	</body>
</html>