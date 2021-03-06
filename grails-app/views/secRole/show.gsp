
<%@ page import="org.itech.klinikav2.domain.SecRole" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-secRole" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="secRole.authority.label" default="Authority" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: secRoleInstance, field: "authority")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
