<stylesheet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mods="http://www.loc.gov/mods/v3"
            xmlns:mets="http://www.loc.gov/METS/" xmlns:slub="http://slub-dresden.de/"
            xmlns:foaf="http://xmlns.com/foaf/0.1/"
            xmlns="http://www.w3.org/1999/XSL/Transform" version="1.0"
            xsi:schemaLocation=
                    "http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-7.xsd
                    http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/version1121/mets.xsd">
    <output method="text" encoding="UTF-8" indent="no" media-type="application/json"/>
    <strip-space elements="*"/>

    <template match="/mets:mets">
        <text>{</text>

        <apply-templates
                select="mets:dmdSec/mets:mdWrap[@MDTYPE='MODS'][1]/mets:xmlData/mods:mods"/>

        <apply-templates
                select="mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='SLUBINFO'][1]/mets:xmlData/slub:info"/>
        <text>}</text>
    </template>
    <template match="mods:mods">
        <call-template name="title">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="issue">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="abstract">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="author">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="persons">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="language">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="publisher">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="publisher_place">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="distributor">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="distributor_place">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="distribution_date">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="classification">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="tag">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="identifier">
            <with-param name="modsElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="corporation">
            <with-param name="modsElement" select="."/>
        </call-template>
    </template>
    <template match="slub:info">
        <text>,</text>
        <call-template name="submitter">
            <with-param name="slubElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="project">
            <with-param name="slubElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="doctype">
            <with-param name="slubElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="collections">
            <with-param name="slubElement" select="."/>
        </call-template>
        <text>,</text>
        <call-template name="processNumber">
            <with-param name="slubElement" select="."/>
        </call-template>
    </template>
    <template name="title">
        <param name="modsElement"/>
        <text>"title":[</text>
        <for-each select="$modsElement/mods:titleInfo/mods:title">
            <call-template name="quote">
                <with-param name="s" select="."/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="issue">
        <param name="modsElement"/>
        <text>"issue":</text>
        <call-template name="quote">
            <with-param name="s"
                        select="$modsElement/mods:part[@type='issue']/mods:detail/mods:number"/>
        </call-template>
    </template>
    <template name="abstract">
        <param name="modsElement"/>
        <text>"abstract":[</text>
        <for-each select="$modsElement/mods:abstract[@type='summary']">
            <call-template name="quote">
                <with-param name="s" select="."/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="author">
        <param name="modsElement"/>
        <text>"author":[</text>
        <for-each
                select="$modsElement/mods:name[@type='personal' and mods:role/mods:roleTerm='aut']">
            <call-template name="quote">
                <with-param name="s"
                            select="concat(mods:namePart[@type='given'], ' ', mods:namePart[@type='family'])"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="persons">
        <param name="modsElement"/>
        <text>"persons":[</text>
        <for-each select="$modsElement/mods:name[@type='personal']">
            <call-template name="quote">
                <with-param name="s"
                            select="concat(mods:namePart[@type='given'], ' ', mods:namePart[@type='family'])"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="language">
        <param name="modsElement"/>
        <text>"language":[</text>
        <for-each select="$modsElement/mods:language/mods:languageTerm">
            <call-template name="quote">
                <with-param name="s" select="."/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="publisher">
        <param name="modsElement"/>
        <text>"publisher":[</text>
        <for-each select="$modsElement/mods:relatedItem[@type='original']">
            <call-template name="quote">
                <with-param name="s" select="mods:originInfo/mods:publisher"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="publisher_place">
        <param name="modsElement"/>
        <text>"publisher_place":[</text>
        <for-each select="$modsElement/mods:originInfo[@eventType='publication']">
            <call-template name="quote">
                <with-param name="s" select="mods:place/mods:placeTerm[@type='text']"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="distributor">
        <param name="modsElement"/>
        <text>"distributor":[</text>
        <for-each select="$modsElement/mods:originInfo[@eventType='distribution']">
            <call-template name="quote">
                <with-param name="s" select="mods:publisher"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="distributor_place">
        <param name="modsElement"/>
        <text>"distributor_place":[</text>
        <for-each select="$modsElement/mods:originInfo[@eventType='distribution']">
            <call-template name="quote">
                <with-param name="s" select="mods:place/mods:placeTerm[@type='text']"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="distribution_date">
        <param name="modsElement"/>
        <text>"distribution_date":[</text>
        <for-each select="$modsElement/mods:originInfo[@eventType='distribution']">
            <call-template name="quote">
                <with-param name="s" select="mods:dateIssued[@keyDate='yes']"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="classification">
        <param name="modsElement"/>
        <text>"classification":[</text>
        <for-each select="$modsElement/mods:classification[@authority and @authority!='z']">
            <call-template name="quote">
                <with-param name="s" select="."/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="tag">
        <param name="modsElement"/>
        <text>"tag":[</text>
        <for-each select="$modsElement/mods:classification[not(@authority) or @authority='z']">
            <call-template name="quote">
                <with-param name="s" select="."/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="identifier">
        <param name="modsElement"/>
        <text>"identifier":[</text>
        <for-each select="$modsElement/mods:identifier">
            <call-template name="quote">
                <with-param name="s" select="."/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="corporation">
        <param name="modsElement"/>
        <text>"corporation":[</text>
        <for-each
                select="$modsElement/mods:name[@type='corporate']/mods:namePart | $modsElement/mods:extension/slub:info/slub:corporation/*">
            <call-template name="quote">
                <with-param name="s" select="."/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="submitter">
        <param name="slubElement"/>
        <text>"submitter":</text>
        <call-template name="quote">
            <with-param name="s" select="$slubElement/slub:submitter/foaf:Person/foaf:name"/>
        </call-template>
    </template>
    <template name="project">
        <param name="slubElement"/>
        <text>"project":</text>
        <call-template name="quote">
            <with-param name="s" select="$slubElement/slub:project"/>
        </call-template>
    </template>
    <template name="doctype">
        <param name="slubElement"/>
        <text>"doctype":</text>
        <call-template name="quote">
            <with-param name="s" select="$slubElement/slub:documentType"/>
        </call-template>
    </template>
    <template name="collections">
        <param name="slubElement"/>
        <text>"collections":[</text>
        <for-each select="$slubElement/slub:collections/slub:collection">
            <call-template name="quote">
                <with-param name="s" select="."/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="processNumber">
        <param name="slubElement"/>
        <text>"process_number":</text>
        <call-template name="quote">
            <with-param name="s" select="$slubElement/slub:processNumber"/>
        </call-template>
    </template>

    <template match="text()"/>

    <template name="quote">
        <param name="s"/>
        <text>"</text>
        <value-of select="translate(normalize-space($s), '&quot;', '')"/>
        <text>"</text>
    </template>
</stylesheet>
