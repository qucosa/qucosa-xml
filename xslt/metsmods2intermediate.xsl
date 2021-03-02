<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mets="http://www.loc.gov/METS/"
                xmlns:mext="http://slub-dresden.de/mets"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:slub="http://slub-dresden.de/"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xsi:schemaLocation="
                    http://www.loc.gov/mods/v3 https://www.loc.gov/standards/mods/v3/mods-3-7.xsd
                    http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd">

    <xsl:output indent="yes" method="xml"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:comment>
            Transformed by metsmods2intermediate stylesheet version 1.0
        </xsl:comment>
        <xsl:apply-templates select="/mets:mets"/>
    </xsl:template>

    <!-- METS -->

    <xsl:template match="mets:mets">
        <data>
            <xsl:copy-of select="@xsi:schemaLocation"/>
            <xsl:apply-templates select="mets:metsHdr"/>
            <xsl:apply-templates select="mets:structMap[@TYPE='LOGICAL']"/>
            <xsl:apply-templates
                    select="mets:amdSec/mets:techMD/mets:mdWrap[@MDTYPE='OTHER'][@OTHERMDTYPE='SLUBINFO'][@MIMETYPE='application/vnd.slub-info+xml']/mets:xmlData/slub:info"/>
            <mods:mods>
                <xsl:apply-templates
                        select="mets:dmdSec/mets:mdWrap[@MDTYPE='MODS']/mets:xmlData/mods:mods"/>
            </mods:mods>
            <xsl:apply-templates select="mets:fileSec"/>
        </data>
    </xsl:template>

    <xsl:template match="mets:metsHdr">
        <state>
            <xsl:value-of select="@RECORDSTATUS"/>
        </state>
        <owner>
            <xsl:value-of select="mets:agent[@ROLE='EDITOR'][@TYPE='ORGANIZATION']/mets:name"/>
        </owner>
        <creationDate>
            <xsl:value-of select="@CREATEDATE"/>
        </creationDate>
    </xsl:template>

    <xsl:template match="mets:structMap[@TYPE='LOGICAL']">
        <type>
            <xsl:value-of select="mets:div/@TYPE"/>
        </type>
    </xsl:template>

    <xsl:template match="mets:fileSec">
        <xsl:for-each select=".//mets:file">
            <file>
                <href>
                    <xsl:value-of select="./mets:FLocat/@xlink:href"/>
                </href>
                <mimetype>
                    <xsl:value-of select="@MIMETYPE"/>
                </mimetype>
                <title>
                    <xsl:value-of select="@mext:LABEL"/>
                </title>
                <download>
                    <xsl:if test="../@USE='DOWNLOAD'">1</xsl:if>
                </download>
                <archive>
                    <xsl:if test="@USE='ARCHIVE'">1</xsl:if>
                </archive>
                <id>
                    <xsl:value-of select="@ID"/>
                </id>
            </file>
        </xsl:for-each>
    </xsl:template>

    <!-- MODS -->

    <xsl:template match="mods:mods">
        <xsl:copy-of select="mods:*"/>
    </xsl:template>

    <!-- SLUB-INFO -->

    <xsl:template match="slub:info">
        <xsl:copy-of select="slub:*"/>
    </xsl:template>

    <!-- Consuming unmatched text nodes -->
    <xsl:template match="text()"/>

</xsl:stylesheet>
