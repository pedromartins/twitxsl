<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml"/>

  <xsl:param name="new_file"/>
  <xsl:param name="old_file"/>
  
  <xsl:variable name="new_feed" select="document($new_file)"/>
  <xsl:variable name="old_feed" select="document($old_file)"/>

  <xsl:template match="/">
    <statuses type="array">
      <xsl:copy-of select="$new_feed/statuses/status"/>
      <xsl:copy-of select="$old_feed/statuses/status"/>
    </statuses>
  </xsl:template>

</xsl:stylesheet>
