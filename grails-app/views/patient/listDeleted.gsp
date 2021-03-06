
<%@ page import="org.itech.klinikav2.domain.Patient"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'patient.label', default: 'Patient')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-patient" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<%--	<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>--%>
			</li>
		</ul>
	</div>
	<div id="list-patient" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="address_city"
						title="${message(code: 'patient.address_city.label', default: 'Addresscity')}" />

					<g:sortableColumn property="address_province"
						title="${message(code: 'patient.address_province.label', default: 'Addressprovince')}" />

					<g:sortableColumn property="address_street"
						title="${message(code: 'patient.address_street.label', default: 'Addressstreet')}" />

					<g:sortableColumn property="address_town"
						title="${message(code: 'patient.address_town.label', default: 'Addresstown')}" />

					<g:sortableColumn property="birthDate"
						title="${message(code: 'patient.birthDate.label', default: 'Birth Date')}" />

					<g:sortableColumn property="dateOfRegistration"
						title="${message(code: 'patient.dateOfRegistration.label', default: 'Date Of Registration')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${patientInstanceList}" status="i" var="patientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="showDeleted" id="${patientInstance.id}">
								${fieldValue(bean: patientInstance, field: "address_city")}
							</g:link></td>

						<td>
							${fieldValue(bean: patientInstance, field: "address_province")}
						</td>

						<td>
							${fieldValue(bean: patientInstance, field: "address_street")}
						</td>

						<td>
							${fieldValue(bean: patientInstance, field: "address_town")}
						</td>

						<td><g:formatDate date="${patientInstance.birthDate}" /></td>

						<td><g:formatDate
								date="${patientInstance.dateOfRegistration}" /></td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${patientInstanceTotal}" />
		</div>
	</div>
</body>
</html>
