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
                select="mets:dmdSec/mets:mdWrap[@MDTYPE=&apos;MODS&apos;][1]/mets:xmlData/mods:mods"/>

        <apply-templates
                select="mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE=&apos;SLUBINFO&apos;][1]/mets:xmlData/slub:info"/>
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
        <text>&quot;title&quot;:[</text>
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
        <text>&quot;issue&quot;:</text>
        <call-template name="quote">
            <with-param name="s"
                        select="$modsElement/mods:part[@type=&apos;issue&apos;]/mods:detail/mods:number"/>
        </call-template>
    </template>
    <template name="abstract">
        <param name="modsElement"/>
        <text>&quot;abstract&quot;:[</text>
        <for-each select="$modsElement/mods:abstract[@type=&apos;summary&apos;]">
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
        <text>&quot;author&quot;:[</text>
        <for-each
                select="$modsElement/mods:name[@type=&apos;personal&apos; and mods:role/mods:roleTerm=&apos;aut&apos;]">
            <call-template name="quote">
                <with-param name="s"
                            select="concat(mods:namePart[@type=&apos;given&apos;], &apos; &apos;, mods:namePart[@type=&apos;family&apos;])"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="persons">
        <param name="modsElement"/>
        <text>&quot;persons&quot;:[</text>
        <for-each select="$modsElement/mods:name[@type=&apos;personal&apos;]">
            <call-template name="quote">
                <with-param name="s"
                            select="concat(mods:namePart[@type=&apos;given&apos;], &apos; &apos;, mods:namePart[@type=&apos;family&apos;])"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="language">
        <param name="modsElement"/>
        <text>&quot;language&quot;:[</text>
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
        <text>&quot;publisher&quot;:[</text>
        <for-each select="$modsElement/mods:relatedItem[@type=&apos;original&apos;]">
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
        <text>&quot;publisher_place&quot;:[</text>
        <for-each select="$modsElement/mods:originInfo[@eventType=&apos;publication&apos;]">
            <call-template name="quote">
                <with-param name="s" select="mods:place/mods:placeTerm[@type=&apos;text&apos;]"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="distributor">
        <param name="modsElement"/>
        <text>&quot;distributor&quot;:[</text>
        <for-each select="$modsElement/mods:originInfo[@eventType=&apos;distribution&apos;]">
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
        <text>&quot;distributor_place&quot;:[</text>
        <for-each select="$modsElement/mods:originInfo[@eventType=&apos;distribution&apos;]">
            <call-template name="quote">
                <with-param name="s" select="mods:place/mods:placeTerm[@type=&apos;text&apos;]"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="distribution_date">
        <param name="modsElement"/>
        <text>&quot;distribution_date&quot;:[</text>
        <for-each select="$modsElement/mods:originInfo[@eventType=&apos;distribution&apos;]">
            <call-template name="quote">
                <with-param name="s" select="mods:dateIssued[@keyDate=&apos;yes&apos;]"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
        <text>]</text>
    </template>
    <template name="classification">
        <param name="modsElement"/>
        <text>&quot;classification&quot;:[</text>
        <for-each select="$modsElement/mods:classification[@authority and @authority!=&apos;z&apos;]">
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
        <text>&quot;tag&quot;:[</text>
        <for-each select="$modsElement/mods:classification[not(@authority) or @authority=&apos;z&apos;]">
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
        <text>&quot;identifier&quot;:[</text>
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
        <text>&quot;corporation&quot;:[</text>
        <for-each
                select="$modsElement/mods:name[@type=&apos;corporate&apos;]/mods:namePart | $modsElement/mods:extension/slub:info/slub:corporation/*">
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
        <text>&quot;submitter&quot;:</text>
        <call-template name="quote">
            <with-param name="s" select="$slubElement/slub:submitter/foaf:Person/foaf:name"/>
        </call-template>
    </template>
    <template name="project">
        <param name="slubElement"/>
        <text>&quot;project&quot;:</text>
        <call-template name="quote">
            <with-param name="s" select="$slubElement/slub:project"/>
        </call-template>
    </template>
    <template name="doctype">
        <param name="slubElement"/>
        <text>&quot;doctype&quot;:</text>
        <call-template name="quote">
            <with-param name="s" select="$slubElement/slub:documentType"/>
        </call-template>
    </template>
    <template name="collections">
        <param name="slubElement"/>
        <text>&quot;collections&quot;:[</text>
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
        <text>&quot;process_number&quot;:</text>
        <call-template name="quote">
            <with-param name="s" select="$slubElement/slub:processNumber"/>
        </call-template>
    </template>

    <template match="text()"/>

    <template name="quote">
        <param name="s"/>
        <text>&quot;</text>
        <value-of select="translate(normalize-space($s), &apos;&quot;\&apos;, &apos;&apos;)"/>
        <text>&quot;</text>
    </template>
</stylesheet>