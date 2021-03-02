<stylesheet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mods="http://www.loc.gov/mods/v3"
            xmlns:slub="http://slub-dresden.de/"
            xmlns:foaf="http://xmlns.com/foaf/0.1/"
            xmlns="http://www.w3.org/1999/XSL/Transform" version="1.0"
            xsi:schemaLocation=
                    "http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-7.xsd">
    <output method="text" encoding="UTF-8" indent="no" media-type="application/json"/>
    <strip-space elements="*"/>

    <template match="/data">
        <text>{</text>

        <call-template name="title"/>
        <text>,</text>
        <call-template name="issue"/>
        <text>,</text>
        <call-template name="abstract"/>
        <text>,</text>
        <call-template name="author"/>
        <text>,</text>
        <call-template name="persons"/>
        <text>,</text>
        <call-template name="language"/>
        <text>,</text>
        <call-template name="publisher"/>
        <text>,</text>
        <call-template name="publisher_place"/>
        <text>,</text>
        <call-template name="distributor"/>
        <text>,</text>
        <call-template name="distributor_place"/>
        <text>,</text>
        <call-template name="distribution_date"/>
        <text>,</text>
        <call-template name="classification"/>
        <text>,</text>
        <call-template name="tag"/>
        <text>,</text>
        <call-template name="identifier"/>
        <text>,</text>
        <call-template name="corporation"/>

        <text>,</text>

        <call-template name="submitter"/>
        <text>,</text>
        <call-template name="project"/>
        <text>,</text>
        <call-template name="doctype"/>
        <text>,</text>
        <call-template name="collections"/>
        <text>,</text>
        <call-template name="processNumber"/>

        <text>}</text>
    </template>


    <template name="title">
        <text>"title":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:titleInfo/mods:title"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="issue">
        <text>"issue":</text>
        <call-template name="quote">
            <with-param name="s"
                        select="./mods:mods/mods:part[@type='issue']/mods:detail/mods:number"/>
        </call-template>
    </template>
    <template name="abstract">
        <text>"abstract":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:abstract[@type='summary']"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="author">
        <text>"author":[</text>
        <for-each select="./mods:mods/mods:name[@type='personal' and mods:role/mods:roleTerm='aut']">
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
        <text>"persons":[</text>
        <for-each select="./mods:mods/mods:name[@type='personal']">
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
        <text>"language":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:language/mods:languageTerm"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="publisher">
        <text>"publisher":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:relatedItem[@type='original']/mods:originInfo/mods:publisher"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="publisher_place">
        <text>"publisher_place":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:originInfo[@eventType='publication']/mods:place/mods:placeTerm[@type='text']"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="distributor">
        <text>"distributor":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:originInfo[@eventType='distribution']/mods:publisher"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="distributor_place">
        <text>"distributor_place":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:originInfo[@eventType='distribution']/mods:place/mods:placeTerm[@type='text']"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="distribution_date">
        <text>"distribution_date":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:originInfo[@eventType='distribution']/mods:dateIssued[@keyDate='yes']"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="classification">
        <text>"classification":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:classification[@authority and @authority!='z']"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="tag">
        <text>"tag":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:classification[not(@authority) or @authority='z']"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="identifier">
        <text>"identifier":[</text>
        <call-template name="quote_and_join">
            <with-param name="elements"
                        select="./mods:mods/mods:identifier"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="corporation">
        <text>"corporation":[</text>
        <call-template name="quote_and_join">
            <with-param
                    name="elements"
                    select="./mods:mods/mods:name[@type='corporate']/mods:namePart
                            | ./mods:mods/mods:extension/slub:info/slub:corporation/*"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="submitter">
        <text>"submitter":</text>
        <call-template name="quote">
            <with-param name="s" select="/slub:info/slub:submitter/foaf:Person/foaf:name"/>
        </call-template>
    </template>
    <template name="project">
        <text>"project":</text>
        <call-template name="quote">
            <with-param name="s" select="/slub:info/slub:project"/>
        </call-template>
    </template>
    <template name="doctype">
        <text>"doctype":</text>
        <call-template name="quote">
            <with-param name="s" select="/slub:info/slub:documentType"/>
        </call-template>
    </template>
    <template name="collections">
        <text>"collections":[</text>
        <call-template name="quote_and_join">
            <with-param
                    name="elements"
                    select="/slub:info/slub:collections/slub:collection"/>
        </call-template>
        <text>]</text>
    </template>
    <template name="processNumber">
        <text>"process_number":</text>
        <call-template name="quote">
            <with-param name="s" select="/slub:info/slub:processNumber"/>
        </call-template>
    </template>

    <template match="text()"/>

    <template name="quote_and_join">
        <param name="elements"/>
        <for-each select="$elements">
            <call-template name="quote">
                <with-param name="s" select="text()"/>
            </call-template>
            <choose>
                <when test="position() != last()">,</when>
            </choose>
        </for-each>
    </template>

    <template name="quote">
        <param name="s"/>
        <text>"</text>
        <value-of select="translate(normalize-space($s), '&quot;', '')"/>
        <text>"</text>
    </template>
</stylesheet>
