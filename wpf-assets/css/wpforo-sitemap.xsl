<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet version="2.0"
		xmlns:html="http://www.w3.org/TR/REC-html40"
		xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
		xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<title>Forum Sitemap</title>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<style type="text/css">
                body {font-family: Arial, Helvetica, sans-serif;font-size: 14px;color: #666666;margin-top: 30px;}
                h2 {font-size: 20px;font-family: Verdana;}
                table {border: 1px solid #666666;border-collapse: collapse;}
                #sitemap tr td {padding: 5px 10px;}
                #sitemap tr th {padding: 10px 10px;}
                #sitemap tr:nth-child(odd) td {background-color: #badfd6 !important;}
                #sitemap tbody tr:hover td {background-color: #badfd6;}
                #sitemap tbody tr:hover td, #sitemap tbody tr:hover td a {color: #000;}
                #content {margin: 0 auto;width: 1000px;}
                .desc a {color: #000000;}
                .desc a:visited {color: #1c90da;}
                a {color: #000000;text-decoration: none;}
                a:visited {color: #666666;}
                a:hover {text-decoration: underline;}
                table { width: 100%;}
                td { font-size: 11px; }
                th { text-align: left; padding-right: 30px; font-size: 14px;}
                thead th { border-bottom: 1px solid #666666; background-color: #f5f5f5; }
                @media screen and (max-width:1024px) { #content {margin: 0 auto;width: 90%;}  }
            </style>
		</head>
		<body>
		<div id="content">
			<h2>Forum Sitemap</h2>
			<p class="desc">
                This is an XML Sitemap designed to increase forum content indexing speed.<br />Generated by wpForo for search engines. More information on <a href="http://sitemaps.org" target="_blank" rel="noopener noreferrer">sitemaps.org</a>.
			</p>
			<xsl:if test="count(sitemap:sitemapindex/sitemap:sitemap) &gt; 0">
				<p class="desc">
					This sitemap index contains <xsl:value-of select="count(sitemap:sitemapindex/sitemap:sitemap)"/> sitemaps.
				</p>
				<table id="sitemap" cellpadding="3">
					<thead>
					<tr>
						<th width="100%">Sitemaps</th>
					</tr>
					</thead>
					<tbody>
					<xsl:for-each select="sitemap:sitemapindex/sitemap:sitemap">
						<xsl:variable name="sitemapURL">
							<xsl:value-of select="sitemap:loc"/>
						</xsl:variable>
						<tr>
							<td>
								<a href="{$sitemapURL}"><xsl:value-of select="sitemap:loc"/></a>
							</td>
						</tr>
					</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="count(sitemap:sitemapindex/sitemap:sitemap) &lt; 1">
				<p class="desc">
					This sitemap contains <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs.
				</p>
				<table id="sitemap" cellpadding="3">
					<thead>
					<tr>
						<th width="80%">URL</th>
						<th title="Last Modification Time" width="20%">Last modified date</th>
					</tr>
					</thead>
					<tbody>
					<xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
					<xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
					<xsl:for-each select="sitemap:urlset/sitemap:url">
						<tr>
							<td>
								<xsl:variable name="itemURL">
									<xsl:value-of select="sitemap:loc"/>
								</xsl:variable>
								<a href="{$itemURL}">
									<xsl:value-of select="sitemap:loc"/>
								</a>
							</td>
							<td>
								<xsl:value-of select="concat(substring(sitemap:lastmod,0,11),concat(' ', substring(sitemap:lastmod,12,5)),concat(' ', substring(sitemap:lastmod,20,6)))"/>
							</td>
						</tr>
					</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
		</body>
		</html>
	</xsl:template>
	</xsl:stylesheet>
