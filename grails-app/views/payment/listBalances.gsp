
<%@ page import="org.itech.klinikav2.domain.Payment" %>
<!DOCTYPE html>
<html>
	<head>
	<r:require module="export"/>
	
	<export:resource />
	
<style type="text/css" title="currentStyle">
@import "../css/demo_table.css";
</style>
		<meta name="layout" content="kickstart">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript"  src="./js/jquery.js"></script><style type="text/css"></style>
		<script type="text/javascript"  src="./js/jquery.dataTables.js"></script>
		
		<script src="./js/modernizr-2.0.6-development-only.js" type="text/javascript"></script>
    	<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
    	<link href="./css/bootstrap-overrides.css" rel="stylesheet" type="text/css">
    	<script src="./js/jquery-1.5.1.min.js" type="text/javascript"></script>
    	<script src="./js/jquery-ui-1.8.17.min.js" type="text/javascript"></script>
		<script src="./js/globalize.js" type="text/javascript"></script>
    	<script src="./js/globalize.culture.en-US.js" type="text/javascript"></script>

    <script type="text/javascript">
        Globalize.culture("en-US");
    </script>
    
    <style type="text/css"></style><script type="text/javascript" src="js/prettify.min.js" id="script-httpbaluptongithubcomjquerysyntaxhighlighterprettifyprettifyminjs"></script><link type="text/css" rel="stylesheet" media="screen" href="css/prettify.min.css" id="stylesheet-httpbaluptongithubcomjquerysyntaxhighlighterprettifyprettifymincss"><link type="text/css" rel="stylesheet" media="screen" href="css/style.min.css" id="stylesheet-httpbaluptongithubcomjquerysyntaxhighlighterstylesstylemincss"><link type="text/css" rel="stylesheet" media="screen" href="css/theme-balupton.min.css" id="stylesheet-httpbaluptongithubcomjquerysyntaxhighlighterstylesthemebaluptonmincss"></head>
<body>		
		
  <div class="container">
        <link type="text/css" href="css/jquery.dataTables_themeroller.css" rel="stylesheet">
<script src="js/jquery.dataTables.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
<script src="js/ZeroClipboard.js" type="text/javascript"></script>
<script src="js/TableTools.js" type="text/javascript"></script>
<link type="text/css" href="css/TableTools.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.syntaxhighlighter.min.js"></script>
<script type="text/javascript">    $.SyntaxHighlighter.init();</script>		

<script type="text/javascript">
    function test(data, type, full) {
        return '<i>' + data + '</i>';
    }
    
    function drawCallback(oSettings) {
        console.log('fnDrawCallback fired');
        console.log(oSettings);
    }

		


</script></head>
	
	
	<script type="text/javascript">

	(function(){
		  var bsa = document.createElement('script');
		     bsa.type = 'text/javascript';
		     bsa.async = true;
		     bsa.src = '//s3.buysellads.com/ac/bsa.js';
		  (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa);
		})();


	
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script><script src="js/ga.js" type="text/javascript"></script>
	
	
	</head>
	<div class="content">
	
	<div class="container">
	<div class="page-header topSlider">
	<h1>Payment<small> Unpaid Balances</small></h1>
	</div>
	<h1>
	
	
	</h1>
	

 
	
		<div id="list-payment" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			
		<table cellpadding="0" cellspacing="0" border="0" class="table  table-bordered" id="MinItem">
		<thead>
			<tr>
			
				<th><g:message code="payment.patient.label" default="Patient" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${paymentInstanceList}" status="i" var="paymentInstance">
			<tr>
				<td>${fieldValue(bean: paymentInstance, field: "patient")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
			
			<div class="paginateButtons">
    	<g:paginate total="${Payment.count()}" />
		</div>
		<export:formats formats="['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']" />
			
<div class="pagination">
		<bs:paginate total="${paymentInstanceTotal}" />
	</div>
		</div>
		</div>
		</div>
		</div>
	</body>
	
	</div>
</body>
</html>
