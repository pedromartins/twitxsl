<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	      indent="yes"/>

  <xsl:variable name="feed" select="document('../xml/current.xml')"/>
  <xsl:variable name="groups" select="document('../xml/groups.xml')"/>

  <xsl:template match="/">
    <html>
      <head>
	<script type="text/javascript" src="js/jquery-1.2.6.js"></script>
	<script type="text/javascript" src="js/twitgroups.js"></script>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="screen" />
      </head>
      <body>
	<h2> Twitter groups! </h2>
	<!-- Groups: -->
	<xsl:for-each select="$groups/groups/group">
	  <a class="{@name}" href="#" onclick="$('#{@name}').toggle('fast')">
	    <xsl:value-of select="@name"/>
	  </a>&#160;
	</xsl:for-each>
	<xsl:apply-templates select="$groups/groups/group"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="group">
    <xsl:variable name="currUsers" select="user"/>
    <div id="{@name}" class="group">
      <span class="group-title"> <xsl:value-of select="@name"/> </span>
      <xsl:apply-templates select="$feed/statuses/status">
	<xsl:with-param name="currUsers" select="user"/>
      </xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="status">
    <xsl:param name="currUsers" select="*"/>
    <xsl:variable name="currUser" select="user/screen_name"/>
    <xsl:if test="$currUser=$currUsers">
      <div class="status">
	<img class="avatar" src="{user/profile_image_url}"/>
	<div class="text">
    	  <span class="username"><xsl:value-of select="$currUser"/> </span>
    	  <span class="status-text"><xsl:value-of select="text"/></span>
	  <div class="footer"/>
	</div>
      </div>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
