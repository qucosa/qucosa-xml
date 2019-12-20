<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mets="http://www.loc.gov/METS/"
                xmlns:mext="http://slub-dresden.de/mets"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:slub="http://slub-dresden.de/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                version="1.0"
                xsi:schemaLocation="http://www.loc.gov/mods/v3 https://www.loc.gov/standards/mods/v3/mods-3-7.xsd http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd">

    <xsl:output indent="yes" method="xml"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="record_state"/>
    <xsl:param name="agent_name"/>
    <xsl:param name="document_type"/>
    <xsl:param name="process_number"/>

    <xsl:template match="/">
        <xsl:comment xml:space="preserve">
            Transformed by intermediate2mods stylesheet version 1.0
        </xsl:comment>
        <xsl:apply-templates select="data"/>
    </xsl:template>

    <xsl:template match="data">
        <mets:mets>
            <xsl:copy-of select="document('')/*/@xsi:schemaLocation"/>

            <xsl:comment>Record header using XSLT parameters</xsl:comment>
            <mets:metsHdr RECORDSTATUS="{$record_state}">
                <mets:agent ROLE="EDITOR" TYPE="ORGANIZATION">
                    <mets:name>
                        <xsl:value-of select="$agent_name"/>
                    </mets:name>
                </mets:agent>
            </mets:metsHdr>

            <xsl:comment>Administrative metadata section for submitter infos and stuff</xsl:comment>
            <mets:amdSec ID="AMD_001">
                <mets:techMD ID="TECH_001">
                    <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="SLUBINFO" MIMETYPE="application/vnd.slub-info+xml">
                        <mets:xmlData>
                            <slub:info>
                                <slub:documentType>
                                    <xsl:value-of select="$document_type"/>
                                </slub:documentType>
                                <slub:processNumber>
                                    <xsl:value-of select="$process_number"/>
                                </slub:processNumber>
                                <xsl:apply-templates select="slub:*"/>
                            </slub:info>
                        </mets:xmlData>
                    </mets:mdWrap>
                </mets:techMD>
            </mets:amdSec>

            <xsl:comment>MODS metadata section for all bibliographic information</xsl:comment>
            <mets:dmdSec ID="DMD_001">
                <mets:mdWrap MDTYPE="MODS">
                    <mets:xmlData>
                        <mods:mods version="3.7">
                            <xsl:apply-templates select="mods:*"/>
                        </mods:mods>
                    </mets:xmlData>
                </mets:mdWrap>
            </mets:dmdSec>

            <xsl:comment>METS File Section listing attachments in their appropriate download group</xsl:comment>
            <mets:fileSec>
                <mets:fileGrp USE="ORIGINAL">
                    <xsl:apply-templates select="file" mode="fileSec-fileGrp-ORIGINAL"/>
                </mets:fileGrp>
            </mets:fileSec>

            <xsl:comment>Logical document structure</xsl:comment>
            <mets:structMap>
                <mets:div DMDID="DMD_001" ADMID="AMD_001" TYPE="{$document_type}">
                    <xsl:apply-templates select="file" mode="structMap"/>
                </mets:div>
            </mets:structMap>

        </mets:mets>
    </xsl:template>

    <xsl:template match="mods:*">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="slub:*">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="file" mode="fileSec-fileGrp-ORIGINAL">
        <mets:file ID="{id}" MIMETYPE="{mimetype}" mext:LABEL="{title}">
            <mets:FLocat LOCTYPE="URL" xlink:href="{href}"/>
        </mets:file>
    </xsl:template>

    <xsl:template match="file" mode="structMap">
        <mets:fptr FILEID="{id}"/>
    </xsl:template>

    <!-- Consuming unmatched text nodes -->
    <xsl:template match="text()"/>

</xsl:stylesheet>
