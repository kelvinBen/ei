<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/Root">
		<xsl:apply-templates>
		<xsl:with-param name="treeInstance"><xsl:value-of select="@TreeName"/></xsl:with-param>
		<xsl:with-param name="parentXmlSrc"><xsl:value-of select="@ParentXMLSrc"/></xsl:with-param>

		<xsl:with-param name="LeafImgSrc"><xsl:value-of select="@LeafImgSrc"/></xsl:with-param>
		<xsl:with-param name="BranchImgSrc"><xsl:value-of select="@BranchImgSrc"/></xsl:with-param>
		<xsl:with-param name="PackageImgSrc"><xsl:value-of select="@PackageImgSrc"/></xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="TreeNode">
	<xsl:param name="LeafImgSrc"/>
	<xsl:param name="BranchImgSrc"/>
	<xsl:param name="PackageImgSrc"/>

	<xsl:param name="treeInstance"/>
		<xsl:variable name="title">
			<xsl:value-of select="@Title"/>
		</xsl:variable>
	
		<div class="clsItem" type="leaf">
			<img type="img">
				<xsl:attribute name="onclick"><xsl:value-of select="$treeInstance"/>.MouseClick(this)</xsl:attribute>
				<xsl:attribute name="src"><xsl:choose><xsl:when test="@NodeImgSrc"><xsl:value-of select="@NodeImgSrc"/></xsl:when><xsl:otherwise><xsl:value-of select="$LeafImgSrc"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:choose><xsl:when test="@NodeId"><xsl:attribute name="NodeId"><xsl:value-of select="@NodeId"/></xsl:attribute></xsl:when></xsl:choose>
			</img>
			<xsl:choose>
				<xsl:when test="@PerImg">
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="@PerImg"/>
						</xsl:attribute>
					</img>
				</xsl:when>
			</xsl:choose>
			<xsl:call-template name="Check">
			<xsl:with-param name="treeInstance"><xsl:value-of select="$treeInstance"/></xsl:with-param>
			</xsl:call-template>
			<span class="clsLabel" type="label">
				<xsl:attribute name="onmousedown"><xsl:value-of select="$treeInstance"/>.NodeMouseDown(this)</xsl:attribute>
				<xsl:attribute name="onmouseover"><xsl:value-of select="$treeInstance"/>.NodeMouseOver(this)</xsl:attribute>
				<xsl:attribute name="onmouseout"><xsl:value-of select="$treeInstance"/>.NodeMouseOut(this)</xsl:attribute>
				<xsl:attribute name="onclick"><xsl:value-of select="$treeInstance"/>.MouseClick(this)</xsl:attribute>
				<xsl:attribute name="oncontextmenu"><xsl:value-of select="$treeInstance"/>.loadContextMenu(this)</xsl:attribute>
				<xsl:attribute name="ondblclick"><xsl:value-of select="$treeInstance"/>.MouseDblClick(this)</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@CheckData or @CheckDataSrc or @RadioData">
						<xsl:attribute name="style">position:relative; left:-1px;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="style">position:relative; left:3px;</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose><xsl:when test="@NodeId"><xsl:attribute name="NodeId"><xsl:value-of select="@NodeId"/></xsl:attribute></xsl:when></xsl:choose>
				<xsl:choose><xsl:when test="@NodeValue"><xsl:attribute name="NodeValue"><xsl:value-of select="@NodeValue"/></xsl:attribute></xsl:when></xsl:choose>
				<xsl:attribute name="title"><xsl:value-of select="@ToolTip"/></xsl:attribute>
				<xsl:attribute name="toolTip"><xsl:value-of select="@ToolTip"/></xsl:attribute>
				<xsl:attribute name="caption">
				<xsl:choose>
					<xsl:when test="@Caption">
						<xsl:value-of select="@Caption"/>
					</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@Title"/>
				</xsl:otherwise>
				</xsl:choose>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@Href">
						<span type="link" class="Link">
							<xsl:choose>
								<xsl:when test="@Target">
									<xsl:attribute name="target"><xsl:value-of select="@Target"/></xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="target">main</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:attribute name="href"><xsl:value-of select="@Href"/></xsl:attribute>
							<xsl:value-of select="$title" disable-output-escaping="yes"/>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$title" disable-output-escaping="yes"/>
					</xsl:otherwise>
				</xsl:choose>
			</span>
		</div>
	</xsl:template>
	<xsl:template match="TreeNode[* or @NodeXMLSrc]">
	<xsl:param name="LeafImgSrc"/>
	<xsl:param name="BranchImgSrc"/>
	<xsl:param name="PackageImgSrc"/>

	<xsl:param name="treeInstance"/>
	<xsl:param name="parentXmlSrc"/>
		<xsl:variable name="title">
			<xsl:value-of select="@Title"/>
		</xsl:variable>
		<div class="clsItem" type="branch">
			<img type="img">
				<xsl:attribute name="onclick"><xsl:value-of select="$treeInstance"/>.MouseClick(this)</xsl:attribute>
				<xsl:attribute name="src"><xsl:choose><xsl:when test="@NodeImgSrc"><xsl:value-of select="@NodeImgSrc"/></xsl:when><xsl:otherwise><xsl:value-of select="$BranchImgSrc"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:choose><xsl:when test="@NodeId"><xsl:attribute name="NodeId"><xsl:value-of select="@NodeId"/></xsl:attribute></xsl:when></xsl:choose>
			</img>
			<img>
				<xsl:attribute name="src">
					<xsl:choose>
						<xsl:when test="@PerImg">	
									<xsl:value-of select="@PerImg"/>
						</xsl:when>
						<xsl:otherwise>
								<xsl:value-of select="$PackageImgSrc"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</img>
			<xsl:call-template name="Check">
			<xsl:with-param name="treeInstance"><xsl:value-of select="$treeInstance"/></xsl:with-param>
			</xsl:call-template>
			<span class="clsLabel" type="label">
				<xsl:attribute name="onmousedown"><xsl:value-of select="$treeInstance"/>.NodeMouseDown(this)</xsl:attribute>
				<xsl:attribute name="onmouseover"><xsl:value-of select="$treeInstance"/>.NodeMouseOver(this)</xsl:attribute>
				<xsl:attribute name="onmouseout"><xsl:value-of select="$treeInstance"/>.NodeMouseOut(this)</xsl:attribute>
				<xsl:attribute name="onclick"><xsl:value-of select="$treeInstance"/>.MouseClick(this)</xsl:attribute>
				<xsl:attribute name="oncontextmenu"><xsl:value-of select="$treeInstance"/>.loadContextMenu(this)</xsl:attribute>
				<xsl:attribute name="ondblclick"><xsl:value-of select="$treeInstance"/>.MouseDblClick(this)</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@CheckData or @CheckDataSrc or @RadioData">
						<xsl:attribute name="style">position:relative; left:-1px;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="style">position:relative; left:3px;</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose><xsl:when test="@NodeId"><xsl:attribute name="NodeId"><xsl:value-of select="@NodeId"/></xsl:attribute></xsl:when></xsl:choose>
				<xsl:choose><xsl:when test="@NodeValue"><xsl:attribute name="NodeValue"><xsl:value-of select="@NodeValue"/></xsl:attribute></xsl:when></xsl:choose>
				<xsl:attribute name="xmlsrc"><xsl:value-of select="@NodeXMLSrc"/></xsl:attribute>
				<xsl:attribute name="parentxmlsrc"><xsl:value-of select="$parentXmlSrc"/></xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="@Title"/></xsl:attribute>
				<xsl:attribute name="toolTip"><xsl:value-of select="@ToolTip"/></xsl:attribute>
				<xsl:attribute name="caption"><xsl:choose><xsl:when test="@Caption"><xsl:value-of select="@Caption"/></xsl:when><xsl:otherwise><xsl:value-of select="@Title"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:choose>
					<xsl:when test="@Href">
						<span type="link" class="Link">
							<xsl:choose>
								<xsl:when test="@Target">
									<xsl:attribute name="target"><xsl:value-of select="@Target"/></xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="target">main</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:attribute name="href"><xsl:value-of select="@Href"/></xsl:attribute>
							<xsl:value-of select="$title" disable-output-escaping="yes"/>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<span class="Link">
							<xsl:value-of select="$title" disable-output-escaping="yes"/>
						</span>
					</xsl:otherwise>
				</xsl:choose>
			</span>
			<div class="hide" type="container">
			<xsl:apply-templates>
			<xsl:with-param name="treeInstance"><xsl:value-of select="$treeInstance"/></xsl:with-param>
			<xsl:with-param name="parentXmlSrc"><xsl:value-of select="$parentXmlSrc"/></xsl:with-param>

			<xsl:with-param name="LeafImgSrc"><xsl:value-of select="$LeafImgSrc"/></xsl:with-param>
			<xsl:with-param name="BranchImgSrc"><xsl:value-of select="$BranchImgSrc"/></xsl:with-param>
			<xsl:with-param name="PackageImgSrc"><xsl:value-of select="$PackageImgSrc"/></xsl:with-param>
			</xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="Check">
	<xsl:param name="treeInstance"/>
		<xsl:choose>
			<xsl:when test="@CheckData">
				<xsl:element name="input">
					<xsl:attribute name="type">checkbox</xsl:attribute>
					<xsl:attribute name="read">1</xsl:attribute>
					<xsl:attribute name="name">CheckData</xsl:attribute>
					<xsl:if test="@ReadOnly='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
					<xsl:if test="@IsChecked='true'"><xsl:attribute name="checked">true</xsl:attribute></xsl:if>
					<xsl:attribute name="onclick"><xsl:value-of select="$treeInstance"/>.MouseClick(this)</xsl:attribute>
					<xsl:attribute name="value"><xsl:value-of select="@CheckData"/></xsl:attribute>
				</xsl:element>
			</xsl:when>
			<xsl:when test="@RadioData">
				<xsl:element name="input">
					<xsl:attribute name="type">radio</xsl:attribute>
					<xsl:attribute name="read">1</xsl:attribute>
					<xsl:attribute name="name">CheckData</xsl:attribute>
					<xsl:if test="@ReadOnly='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
					<xsl:if test="@IsChecked='true'"><xsl:attribute name="checked">true</xsl:attribute></xsl:if>
					<xsl:attribute name="onclick"><xsl:value-of select="$treeInstance"/>.MouseClick(this)</xsl:attribute>
					<xsl:attribute name="value"><xsl:value-of select="@RadioData"/></xsl:attribute>
				</xsl:element>
			</xsl:when>
			<xsl:when test="@CheckDataSrc">
				<xsl:element name="input">
					<xsl:attribute name="type">checkbox</xsl:attribute>
					<xsl:attribute name="read">0</xsl:attribute>
					<xsl:attribute name="name">CheckData</xsl:attribute>
					<xsl:attribute name="value"/>
					<xsl:attribute name="onclick"><xsl:value-of select="$treeInstance"/>.MouseClick(this)</xsl:attribute>
					<xsl:attribute name="src"><xsl:value-of select="@CheckDataSrc"/></xsl:attribute>
				</xsl:element>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>