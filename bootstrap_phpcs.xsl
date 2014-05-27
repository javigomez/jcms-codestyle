<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"  encoding="UTF-8"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Joomla! CMS PHPCS Results</title>
				<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
				<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
				<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
				<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
				<script src="/jcms-codestyle/assets/scripts.js"></script>
			</head>
			<body>
				<div class="container">
					<h2 class="page-header">Joomla! CMS Codestyle Test Results</h2>
					<div>
						<div class="panel panel-default pull-right">
							<div class="panel-heading">
								<h5 class="panel-title">Filter Options</h5>
							</div>
							<div class="panel-body">
								<div class="btn-group type-filter active" data-toggle="buttons-checkbox" data-original-title="" style="display: block;">
									<button type="button" class="btn btn-default error">Error</button>
									<button type="button" class="btn btn-default warning">Warning</button>
						    	</div>
							</div>
						</div>
						<p>This is the result of the codestyle checker with all exceptions removed.  It is designed to aide in bringing the CMS in compliance with the Joomla! Coding Standard.</p>
						<p><span class="label label-primary">Note</span> The results pages are rendered as a XML document with a XSL template, these will be slow to load.</p>
						<p><a href="/jcms-codestyle/index.html">Return to Index</a></p>
					</div>
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Name</th>
								<th>Errors</th>
								<th>Warnings</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="phpcs/file">
								<tr>
									<td>
										<xsl:value-of select="@name" />
									</td>
									<td>
										<span class="label label-danger"><xsl:value-of select="@errors" /></span>
									</td>
									<td>
										<span class="label label-warning"><xsl:value-of select="@warnings" /></span>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<xsl:for-each select="error">
											<div class="error">
												<div class="panel panel-danger">
													<div class="panel-heading">
														<xsl:value-of select="self::node()"/>
													</div>
													<table class="table table-striped table-bordered table-condensed">
														<tr>
															<td><b>Line:</b></td>
															<td><xsl:value-of select="@line" /></td>
														</tr>
														<tr>
															<td><b>Column:</b></td>
															<td><xsl:value-of select="@column" /></td>
														</tr>
														<tr>
															<td><b>Source:</b></td>
															<td><xsl:value-of select="@source" /></td>
														</tr>
													</table>
												</div>
											</div>
										</xsl:for-each>
										<xsl:for-each select="warning">
											<div class="warning">
												<div class="panel panel-warning">
													<div class="panel-heading">
														<xsl:value-of select="self::node()"/>
													</div>
													<table class="table table-striped table-bordered table-condensed">
														<tr>
															<td><b>Line:</b></td>
															<td><xsl:value-of select="@line" /></td>
														</tr>
														<tr>
															<td><b>Column:</b></td>
															<td><xsl:value-of select="@column" /></td>
														</tr>
														<tr>
															<td><b>Source:</b></td>
															<td><xsl:value-of select="@source" /></td>
														</tr>
													</table>
												</div>
											</div>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
