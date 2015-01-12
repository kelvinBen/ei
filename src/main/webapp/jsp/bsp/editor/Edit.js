//
// Constants
//
var MENU_SEPARATOR = ""; // Context menu separator

//
// Globals
//
var docimgnum = 0;

var docComplete = false;
var initialDocComplete = false;

var QueryStatusToolbarButtons = new Array();
var QueryStatusEditMenu = new Array();
var QueryStatusFormatMenu = new Array();
var QueryStatusHTMLMenu = new Array();
var QueryStatusTableMenu = new Array();
var QueryStatusZOrderMenu = new Array();
var QueryStatusZOrderMenuTool = new Array();
var ContextMenu = new Array();
var GeneralContextMenu = new Array();
var TableContextMenu = new Array();
var AbsPosContextMenu = new Array();
var TableAttributeMenu = new Array();
var ImageAttributeMenu = new Array();
var CustAttributeMenu = new Array();

//
// Utility functions
//

// Constructor for custom object that represents an item on the context menu
function ContextMenuItem(string, cmdId) {
  this.string = string;
  this.cmdId = cmdId;
}

// Constructor for custom object that represents a QueryStatus command and 
// corresponding toolbar element.
function QueryStatusItem(command, element) {
  this.command = command;
  this.element = element;
}

//
// Event handlers
//
function window_onload() {
  Document_onLoad();
  tbContentElement.UseDivOnCarriageReturn = true;
  tbContentElement.SourceCodePreservation = true;
  // Initialze QueryStatus tables. These tables associate a command id with the
  // corresponding button object. Must be done on window load, 'cause the buttons must exist.
  QueryStatusToolbarButtons[0] = new QueryStatusItem(DECMD_BOLD, document.body.all["DECMD_BOLD"]);
  QueryStatusToolbarButtons[1] = new QueryStatusItem(DECMD_COPY, document.body.all["DECMD_COPY"]);
  QueryStatusToolbarButtons[2] = new QueryStatusItem(DECMD_CUT, document.body.all["DECMD_CUT"]);
  QueryStatusToolbarButtons[3] = new QueryStatusItem(DECMD_HYPERLINK, document.body.all["DECMD_HYPERLINK"]);
  QueryStatusToolbarButtons[4] = new QueryStatusItem(DECMD_INDENT, document.body.all["DECMD_INDENT"]);
  QueryStatusToolbarButtons[5] = new QueryStatusItem(DECMD_ITALIC, document.body.all["DECMD_ITALIC"]);
  QueryStatusToolbarButtons[6] = new QueryStatusItem(DECMD_JUSTIFYLEFT, document.body.all["DECMD_JUSTIFYLEFT"]);
  QueryStatusToolbarButtons[7] = new QueryStatusItem(DECMD_JUSTIFYCENTER, document.body.all["DECMD_JUSTIFYCENTER"]);
  QueryStatusToolbarButtons[8] = new QueryStatusItem(DECMD_JUSTIFYRIGHT, document.body.all["DECMD_JUSTIFYRIGHT"]);
  QueryStatusToolbarButtons[9] = new QueryStatusItem(DECMD_LOCK_ELEMENT, document.body.all["DECMD_LOCK_ELEMENT"]);
  QueryStatusToolbarButtons[10] = new QueryStatusItem(DECMD_MAKE_ABSOLUTE, document.body.all["DECMD_MAKE_ABSOLUTE"]);
  QueryStatusToolbarButtons[11] = new QueryStatusItem(DECMD_ORDERLIST, document.body.all["DECMD_ORDERLIST"]);
  QueryStatusToolbarButtons[12] = new QueryStatusItem(DECMD_OUTDENT, document.body.all["DECMD_OUTDENT"]);
  QueryStatusToolbarButtons[13] = new QueryStatusItem(DECMD_PASTE, document.body.all["DECMD_PASTE"]);
  QueryStatusToolbarButtons[14] = new QueryStatusItem(DECMD_REDO, document.body.all["DECMD_REDO"]);
  QueryStatusToolbarButtons[15] = new QueryStatusItem(DECMD_UNDERLINE, document.body.all["DECMD_UNDERLINE"]);
  QueryStatusToolbarButtons[16] = new QueryStatusItem(DECMD_UNDO, document.body.all["DECMD_UNDO"]);
  QueryStatusToolbarButtons[17] = new QueryStatusItem(DECMD_UNORDERLIST, document.body.all["DECMD_UNORDERLIST"]);
  QueryStatusToolbarButtons[18] = new QueryStatusItem(DECMD_INSERTTABLE, document.body.all["DECMD_INSERTTABLE"]);
  QueryStatusToolbarButtons[19] = new QueryStatusItem(DECMD_INSERTROW, document.body.all["DECMD_INSERTROW"]);
  QueryStatusToolbarButtons[20] = new QueryStatusItem(DECMD_DELETEROWS, document.body.all["DECMD_DELETEROWS"]);
  QueryStatusToolbarButtons[21] = new QueryStatusItem(DECMD_INSERTCOL, document.body.all["DECMD_INSERTCOL"]);
  QueryStatusToolbarButtons[22] = new QueryStatusItem(DECMD_DELETECOLS, document.body.all["DECMD_DELETECOLS"]);
  QueryStatusToolbarButtons[23] = new QueryStatusItem(DECMD_INSERTCELL, document.body.all["DECMD_INSERTCELL"]);
  QueryStatusToolbarButtons[24] = new QueryStatusItem(DECMD_DELETECELLS, document.body.all["DECMD_DELETECELLS"]);
  QueryStatusToolbarButtons[25] = new QueryStatusItem(DECMD_MERGECELLS, document.body.all["DECMD_MERGECELLS"]);
  QueryStatusToolbarButtons[26] = new QueryStatusItem(DECMD_SPLITCELL, document.body.all["DECMD_SPLITCELL"]);
  QueryStatusToolbarButtons[27] = new QueryStatusItem(DECMD_SETFORECOLOR, document.body.all["DECMD_SETFORECOLOR"]);
  QueryStatusToolbarButtons[28] = new QueryStatusItem(DECMD_SETBACKCOLOR, document.body.all["DECMD_SETBACKCOLOR"]);
  QueryStatusToolbarButtons[29] = new QueryStatusItem(DECMD_BRING_TO_FRONT, document.body.all["DECMD_BRINGTOFRONT"]);
  QueryStatusToolbarButtons[30] = new QueryStatusItem(DECMD_SEND_TO_BACK, document.body.all["DECMD_SENDTOBACK"]);
  QueryStatusToolbarButtons[31] = new QueryStatusItem(DECMD_BRING_FORWARD, document.body.all["DECMD_BRINGFORWARD"]);
  QueryStatusToolbarButtons[32] = new QueryStatusItem(DECMD_SEND_BACKWARD, document.body.all["DECMD_SENDBACKWARD"]);
  QueryStatusToolbarButtons[33] = new QueryStatusItem(DECMD_BRING_ABOVE_TEXT, document.body.all["DECMD_BRINGABOVETEXT"]);
  QueryStatusToolbarButtons[34] = new QueryStatusItem(DECMD_SEND_BELOW_TEXT, document.body.all["DECMD_SENDBELOWTEXT"]);
  QueryStatusToolbarButtons[35] = new QueryStatusItem(DECMD_IMAGE, document.body.all["INFO_INSERTCLASS"]);
  QueryStatusToolbarButtons[36] = new QueryStatusItem(DECMD_IMAGE, document.body.all["INFO_INSERTSCROLL"]);
  QueryStatusToolbarButtons[37] = new QueryStatusItem(DECMD_IMAGE, document.body.all["INFO_INSERTSTATIC"]);
  QueryStatusToolbarButtons[38] = new QueryStatusItem(DECMD_IMAGE, document.body.all["INFO_INSERTFLOAT"]);
  QueryStatusToolbarButtons[39] = new QueryStatusItem(DECMD_IMAGE, document.body.all["INFO_INSERTCELL"]);
  QueryStatusEditMenu[0] = new QueryStatusItem(DECMD_UNDO, document.body.all["EDIT_UNDO"]);
  QueryStatusEditMenu[1] = new QueryStatusItem(DECMD_REDO, document.body.all["EDIT_REDO"]);
  QueryStatusEditMenu[2] = new QueryStatusItem(DECMD_CUT, document.body.all["EDIT_CUT"]);
  QueryStatusEditMenu[3] = new QueryStatusItem(DECMD_COPY, document.body.all["EDIT_COPY"]);
  QueryStatusEditMenu[4] = new QueryStatusItem(DECMD_PASTE, document.body.all["EDIT_PASTE"]);
  QueryStatusEditMenu[5] = new QueryStatusItem(DECMD_DELETE, document.body.all["EDIT_DELETE"]);
  QueryStatusHTMLMenu[0] = new QueryStatusItem(DECMD_HYPERLINK, document.body.all["HTML_HYPERLINK"]);
  QueryStatusHTMLMenu[1] = new QueryStatusItem(DECMD_IMAGE, document.body.all["HTML_IMAGE"]);
  QueryStatusFormatMenu[0] = new QueryStatusItem(DECMD_FONT, document.body.all["FORMAT_FONT"]);
  QueryStatusFormatMenu[1] = new QueryStatusItem(DECMD_BOLD, document.body.all["FORMAT_BOLD"]);
  QueryStatusFormatMenu[2] = new QueryStatusItem(DECMD_ITALIC, document.body.all["FORMAT_ITALIC"]);
  QueryStatusFormatMenu[3] = new QueryStatusItem(DECMD_UNDERLINE, document.body.all["FORMAT_UNDERLINE"]);
  QueryStatusFormatMenu[4] = new QueryStatusItem(DECMD_JUSTIFYLEFT, document.body.all["FORMAT_JUSTIFYLEFT"]);
  QueryStatusFormatMenu[5] = new QueryStatusItem(DECMD_JUSTIFYCENTER, document.body.all["FORMAT_JUSTIFYCENTER"]);
  QueryStatusFormatMenu[6] = new QueryStatusItem(DECMD_JUSTIFYRIGHT, document.body.all["FORMAT_JUSTIFYRIGHT"]);
  QueryStatusFormatMenu[7] = new QueryStatusItem(DECMD_SETFORECOLOR, document.body.all["FORMAT_SETFORECOLOR"]);
  QueryStatusFormatMenu[8] = new QueryStatusItem(DECMD_SETBACKCOLOR, document.body.all["FORMAT_SETBACKCOLOR"]);
  QueryStatusTableMenu[0] = new QueryStatusItem(DECMD_INSERTTABLE, document.body.all["TABLE_INSERTTABLE"]);
  QueryStatusTableMenu[1] = new QueryStatusItem(DECMD_INSERTROW, document.body.all["TABLE_INSERTROW"]);
  QueryStatusTableMenu[2] = new QueryStatusItem(DECMD_DELETEROWS, document.body.all["TABLE_DELETEROW"]);
  QueryStatusTableMenu[3] = new QueryStatusItem(DECMD_INSERTCOL, document.body.all["TABLE_INSERTCOL"]);
  QueryStatusTableMenu[4] = new QueryStatusItem(DECMD_DELETECOLS, document.body.all["TABLE_DELETECOL"]);
  QueryStatusTableMenu[5] = new QueryStatusItem(DECMD_INSERTCELL, document.body.all["TABLE_INSERTCELL"]);
  QueryStatusTableMenu[6] = new QueryStatusItem(DECMD_DELETECELLS, document.body.all["TABLE_DELETECELL"]);
  QueryStatusTableMenu[7] = new QueryStatusItem(DECMD_MERGECELLS, document.body.all["TABLE_MERGECELL"]);
  QueryStatusTableMenu[8] = new QueryStatusItem(DECMD_SPLITCELL, document.body.all["TABLE_SPLITCELL"]);
  QueryStatusZOrderMenu[0] = new QueryStatusItem(DECMD_SEND_TO_BACK, document.body.all["ZORDER_SENDBACK"]);
  QueryStatusZOrderMenu[1] = new QueryStatusItem(DECMD_BRING_TO_FRONT, document.body.all["ZORDER_BRINGFRONT"]);
  QueryStatusZOrderMenu[2] = new QueryStatusItem(DECMD_SEND_BACKWARD, document.body.all["ZORDER_SENDBACKWARD"]);
  QueryStatusZOrderMenu[3] = new QueryStatusItem(DECMD_BRING_FORWARD, document.body.all["ZORDER_BRINGFORWARD"]);
  QueryStatusZOrderMenu[4] = new QueryStatusItem(DECMD_SEND_BELOW_TEXT, document.body.all["ZORDER_BELOWTEXT"]);
  QueryStatusZOrderMenu[5] = new QueryStatusItem(DECMD_BRING_ABOVE_TEXT, document.body.all["ZORDER_ABOVETEXT"]);
  
  // Initialize the context menu arrays.
  GeneralContextMenu[0] = new ContextMenuItem("剪切", DECMD_CUT);
  GeneralContextMenu[1] = new ContextMenuItem("复制", DECMD_COPY);
  GeneralContextMenu[2] = new ContextMenuItem("粘贴", DECMD_PASTE);
//  GeneralContextMenu[3] = new ContextMenuItem(MENU_SEPARATOR, 0);
//  GeneralContextMenu[4] = new ContextMenuItem("页面属性", DECMD_ATTRIBUTEPAGE);
  
  TableAttributeMenu[0] = new ContextMenuItem(MENU_SEPARATOR, 0);
  TableAttributeMenu[1] = new ContextMenuItem("属性", DECMD_ATTRIBUTETABLE);
  
  ImageAttributeMenu[0] = new ContextMenuItem(MENU_SEPARATOR, 0);
  ImageAttributeMenu[1] = new ContextMenuItem("属性", DECMD_ATTRIBUTEIMAGE);
  
  CustAttributeMenu[0] = new ContextMenuItem(MENU_SEPARATOR, 0);
  CustAttributeMenu[1] = new ContextMenuItem("属性", DECMD_ATTRIBUTECUST);
    
  TableContextMenu[0] = new ContextMenuItem(MENU_SEPARATOR, 0);
  TableContextMenu[1] = new ContextMenuItem("插入行", DECMD_INSERTROW);
  TableContextMenu[2] = new ContextMenuItem("删除行", DECMD_DELETEROWS);
  TableContextMenu[3] = new ContextMenuItem(MENU_SEPARATOR, 0);
  TableContextMenu[4] = new ContextMenuItem("插入列", DECMD_INSERTCOL);
  TableContextMenu[5] = new ContextMenuItem("删除列", DECMD_DELETECOLS);
  TableContextMenu[6] = new ContextMenuItem(MENU_SEPARATOR, 0);
  TableContextMenu[7] = new ContextMenuItem("插入单元格", DECMD_INSERTCELL);
  TableContextMenu[8] = new ContextMenuItem("删除单元格", DECMD_DELETECELLS);
  TableContextMenu[9] = new ContextMenuItem("合并单元格", DECMD_MERGECELLS);
  TableContextMenu[10] = new ContextMenuItem("拆分单元格", DECMD_SPLITCELL);
  TableContextMenu[11] = new ContextMenuItem(MENU_SEPARATOR, 0);
  TableContextMenu[12] = new ContextMenuItem("单元格属性", DECMD_ATTRIBUTECELL);
  
  AbsPosContextMenu[0] = new ContextMenuItem(MENU_SEPARATOR, 0);
  AbsPosContextMenu[1] = new ContextMenuItem("置于底层", DECMD_SEND_TO_BACK);
  AbsPosContextMenu[2] = new ContextMenuItem("置于顶层", DECMD_BRING_TO_FRONT);
  AbsPosContextMenu[3] = new ContextMenuItem(MENU_SEPARATOR, 0);
  AbsPosContextMenu[4] = new ContextMenuItem("下移一层", DECMD_SEND_BACKWARD);
  AbsPosContextMenu[5] = new ContextMenuItem("上移一层", DECMD_BRING_FORWARD);
  AbsPosContextMenu[6] = new ContextMenuItem(MENU_SEPARATOR, 0);
  AbsPosContextMenu[7] = new ContextMenuItem("置于文字下方", DECMD_SEND_BELOW_TEXT);
  AbsPosContextMenu[8] = new ContextMenuItem("置于文字上方", DECMD_BRING_ABOVE_TEXT);
}

//页面加载时屏蔽右键菜单
function Document_onLoad(){
} 

function InsertTable() {
  var pVar = ObjTableInfo;
  var args = new Array();
  var arr = null;
     
  // Display table information dialog
  args["NumRows"] = ObjTableInfo.NumRows;
  args["NumCols"] = ObjTableInfo.NumCols;
  args["TableAttrs"] = ObjTableInfo.TableAttrs;
  args["CellAttrs"] = ObjTableInfo.CellAttrs;
  args["Caption"] = ObjTableInfo.Caption;
  
  arr = null;
    
  arr = showModalDialog( "instable.htm",
                             args,
                             "font-family:Verdana; font-size:12; dialogWidth:450px; dialogHeight:260px; status:no");
  if (arr != null) {
  
    // Initialize table object
    for ( elem in arr ) {
      if ("NumRows" == elem && arr["NumRows"] != null) {
        ObjTableInfo.NumRows = arr["NumRows"];
      } else if ("NumCols" == elem && arr["NumCols"] != null) {
        ObjTableInfo.NumCols = arr["NumCols"];
      } else if ("TableAttrs" == elem) {
        ObjTableInfo.TableAttrs = arr["TableAttrs"];
      } else if ("CellAttrs" == elem) {
        ObjTableInfo.CellAttrs = arr["CellAttrs"];
      } else if ("Caption" == elem) {
        ObjTableInfo.Caption = arr["Caption"];
      }
    }
    
    tbContentElement.ExecCommand(DECMD_INSERTTABLE,OLECMDEXECOPT_DODEFAULT, pVar);  
  }
}

function tbContentElement_ShowContextMenu() {
  var menuStrings = new Array();
  var menuStates = new Array();
  var state;
  var i
  var idx = 0;

  // Rebuild the context menu. 
  ContextMenu.length = 0;

  // Always show general menu
  for (i=0; i<GeneralContextMenu.length; i++) {
    ContextMenu[idx++] = GeneralContextMenu[i];
  }

  // Is the selection inside a table? Add table menu if so
  if (tbContentElement.QueryStatus(DECMD_INSERTROW) != DECMDF_DISABLED) {
    for (i=0; i<TableContextMenu.length; i++) {
      ContextMenu[idx++] = TableContextMenu[i];
    }
  }
  
  if (tbContentElement.DOM.selection.type == "Control"){
  	var rg = tbContentElement.DOM.selection.createRange();
  	if (rg != null){
  		var curEl = rg.commonParentElement();
  		if (curEl.tagName.toLowerCase() == "table"){
		    for (i=0; i<TableAttributeMenu.length; i++) {
		      ContextMenu[idx++] = TableAttributeMenu[i];
		    }
  		}
  		else if (curEl.tagName.toLowerCase() == "img"){
  			var curType = curEl.getAttribute("type");
  			if (curType == null)
  				curType = "image";
  			else
  				curType = curType.toLowerCase();
  			if (curType == "infoclass" 
  				|| curType == "infoscroll" 
  				|| curType == "infocell" 
  				|| curType == "static"
  				|| curType == "float"){
			    for (i=0; i<CustAttributeMenu.length; i++) {
			      ContextMenu[idx++] = CustAttributeMenu[i];
			    }
  			}
  			else{
			    for (i=0; i<ImageAttributeMenu.length; i++) {
			      ContextMenu[idx++] = ImageAttributeMenu[i];
			    }
  			}
  		}
  	}
  }

  // Is the selection on an absolutely positioned element? Add z-index commands if so
  if (tbContentElement.QueryStatus(DECMD_LOCK_ELEMENT) != DECMDF_DISABLED) {
    for (i=0; i<AbsPosContextMenu.length; i++) {
      ContextMenu[idx++] = AbsPosContextMenu[i];
    }
  }

  // Set up the actual arrays that get passed to SetContextMenu
  for (i=0; i<ContextMenu.length; i++) {
    menuStrings[i] = ContextMenu[i].string;
    if (ContextMenu[i].cmdId == DECMD_ATTRIBUTETABLE
    	|| ContextMenu[i].cmdId == DECMD_ATTRIBUTEPAGE
    	|| ContextMenu[i].cmdId == DECMD_ATTRIBUTECELL
    	|| ContextMenu[i].cmdId == DECMD_ATTRIBUTEIMAGE
    	|| ContextMenu[i].cmdId == DECMD_ATTRIBUTECUST){
    	menuStates[i] = OLE_TRISTATE_UNCHECKED;
    }
    else {
	    if (menuStrings[i] != MENU_SEPARATOR) {
	      state = tbContentElement.QueryStatus(ContextMenu[i].cmdId);
	    } else {
	      state = DECMDF_ENABLED;
	    }
	    if (state == DECMDF_DISABLED || state == DECMDF_NOTSUPPORTED) {
	      menuStates[i] = OLE_TRISTATE_GRAY;
	    } else if (state == DECMDF_ENABLED || state == DECMDF_NINCHED) {
	      menuStates[i] = OLE_TRISTATE_UNCHECKED;
	    } else { // DECMDF_LATCHED
	      menuStates[i] = OLE_TRISTATE_CHECKED;
	    }
	}
  }
  
  // Set the context menu
  tbContentElement.SetContextMenu(menuStrings, menuStates);
}

function showPageAttribute(){
	var curEl;
	var arr = new Array();
	curEl = tbContentElement.DOM.body;
	arr["title"] = tbContentElement.DOM.title;
	arr["background"] = curEl.getAttribute("background");
	arr["bgproperties"] = curEl.getAttribute("bgproperties");
	arr["bgcolor"] = curEl.getAttribute("bgColor");
	arr["link"] = curEl.getAttribute("link");
	arr["text"] = curEl.getAttribute("text");
	arr["vlink"] = curEl.getAttribute("vLink");
	arr["alink"] = curEl.getAttribute("aLink");
	arr["topmargin"] = curEl.getAttribute("topMargin");
	arr["leftmargin"] = curEl.getAttribute("leftMargin");
	var rtnValue = showModalDialog("WebProperty.htm",
									arr,
									"font-family:Verdana; font-size:12; dialogWidth:480px; dialogHeight:320px; status:no");
	if (rtnValue != null){
		for (elem in rtnValue){
			if (elem.toLowerCase() == "title"){
/*				var baseUrl = tbContentElement.BaseURL;
				var sSource = tbContentElement.FilterSourceCode(tbContentElement.DocumentHTML);
				var newValue = "";
				if (sSource.indexOf("<title>")>=0){
					newValue += sSource.substr(0, sSource.indexOf("<title>"));
					newValue += "<title>" + rtnValue[elem];
					newValue += sSource.substr(sSource.indexOf("</title>"));
				}
				else if (sSource.indexOf("<TITLE>")>=0){
					newValue += sSource.substr(0, sSource.indexOf("<TITLE>"));
					newValue += "<TITLE>" + rtnValue[elem];
					newValue += sSource.substr(sSource.indexOf("</TITLE>"));
				}
				else{
					newValue = sSource;
				}
				tbContentElement.DocumentHTML = newValue;
				tbContentElement.BaseURL = baseUrl;
*/			}
			else{
				if (rtnValue[elem] != null && rtnValue[elem] != ""){
					curEl.removeAttribute(elem);
					curEl.setAttribute(elem, rtnValue[elem]);
				}
				else{
					curEl.removeAttribute(elem);
				}
			}
		}
	}
	tbContentElement.focus();
}

function showTableAttribute(){
	var curEl;
	var arr = new Array();
	if (tbContentElement.DOM.selection.type == "Control"){
		var rg = tbContentElement.DOM.selection.createRange();
		if (rg != null){
			curEl = rg.commonParentElement();
			if (curEl.tagName.toLowerCase() == "table"){
				arr["align"] = curEl.getAttribute("align");
				arr["cellpadding"] = curEl.getAttribute("cellPadding");
				arr["cellspacing"] = curEl.getAttribute("cellSpacing");
				arr["border"] = curEl.getAttribute("border");
				arr["bordercolor"] = curEl.getAttribute("bordercolor");
				arr["bordercolorlight"] = curEl.getAttribute("bordercolorlight");
				arr["bordercolordark"] = curEl.getAttribute("bordercolordark");
				arr["bgcolor"] = curEl.getAttribute("bgcolor");
				arr["background"] = curEl.getAttribute("background");
				arr["width"] = curEl.getAttribute("width");
				arr["height"] = curEl.getAttribute("height");
				var rtnValue = showModalDialog("TableProperty.htm",
												arr,
												"font-family:Verdana; font-size:12; dialogWidth:450px; dialogHeight:400px; status:no");
				if (rtnValue != null){
					for (elem in rtnValue){
						if (rtnValue[elem] != null && rtnValue[elem] != ""){
							curEl.setAttribute(elem, rtnValue[elem]);
						}
						else{
							curEl.removeAttribute(elem);
						}
					}
				}
			}
		}
	}
	tbContentElement.focus();
}

function showTableCellAttribute(){
	var curEl;
	var arr = new Array();
	if (tbContentElement.DOM.selection.type == "Control"){
		var rg = tbContentElement.DOM.selection.createRange();
		if (rg != null){
			curEl = rg.commonParentElement();
		}
	}
	else{
		var rg = tbContentElement.DOM.selection.createRange();
		if (rg != null){
			rg.collapse();
			curEl = rg.parentElement();
		}
	}
	while (curEl != null && curEl.tagName.toLowerCase() != "td" && curEl.tagName.toLowerCase() != "th"){
		curEl = curEl.parentElement;
	}
	if (curEl != null){
		arr["align"] = curEl.getAttribute("align");
		arr["valign"] = curEl.getAttribute("valign");
		arr["rowspan"] = curEl.getAttribute("rowSpan");
		arr["collspan"] = curEl.getAttribute("collSpan");
		arr["nowrap"] = curEl.getAttribute("nowrap");
		arr["bordercolor"] = curEl.getAttribute("borderColor");
		arr["bordercolorlight"] = curEl.getAttribute("borderColorLight");
		arr["bordercolordark"] = curEl.getAttribute("borderColorDark");
		arr["bgcolor"] = curEl.getAttribute("bgColor");
		arr["background"] = curEl.getAttribute("background");
		arr["width"] = curEl.getAttribute("width");
		arr["height"] = curEl.getAttribute("height");
//		if (curEl.tagName.toLowerCase() == "th"){
//			arr["th"] = "th";
//		}
//		else{
//			arr["td"] = "td";
//		}
		var rtnValue = showModalDialog("TableCellProperty.htm?tmp=" + Math.random(),
										arr,
										"font-family:Verdana; font-size:12; dialogWidth:550px; dialogHeight:410px; status:no");
		if (rtnValue != null){
			for (elem in rtnValue){
				if (rtnValue[elem] != null && rtnValue[elem] != ""){
					if (elem == "th"){
//						alert("th");
//						curEl.tagName = rtnValue[elem];
					}
					else{
						curEl.setAttribute(elem, rtnValue[elem]);
					}
				}
				else{
					curEl.removeAttribute(elem);
				}
			}
		}
	}
	tbContentElement.focus();
}

function tbContentElement_ContextMenuAction(itemIndex) {
  
  if (ContextMenu[itemIndex].cmdId == DECMD_INSERTTABLE) {
    InsertTable();
  } 
  else if(ContextMenu[itemIndex].cmdId == DECMD_ATTRIBUTEPAGE){
  	showPageAttribute();
  }
  else if(ContextMenu[itemIndex].cmdId == DECMD_ATTRIBUTETABLE){
  	showTableAttribute();
  }
  else if(ContextMenu[itemIndex].cmdId == DECMD_ATTRIBUTEIMAGE){
  	DECMD_IMAGE_onclick();
  }
  else if(ContextMenu[itemIndex].cmdId == DECMD_ATTRIBUTECELL){
  	showTableCellAttribute();
  }
  else if(ContextMenu[itemIndex].cmdId == DECMD_ATTRIBUTECUST){
  	if (tbContentElement.DOM.selection.type == "Control"){
  		var rg = tbContentElement.DOM.selection.createRange();
  		var curEl = rg.commonParentElement();
		var curType = curEl.getAttribute("type");
		if (curType == null)
			curType = "image";
		else
			curType = curType.toLowerCase();
  		
  		switch (curType){
  		case "infoclass":
  			INFO_INSERTCLASS_onclick();
  			break;
  		case "infoscroll":
  			INFO_INSERTSCROLL_onclick();
  			break;
  		case "infocell":
  			INFO_INSERTCELL_onclick();
  			break;
  		case "static":
  			INFO_INSERTSTATIC_onclick();
  			break;
  		case "float":
  			INFO_INSERTFLOAT_onclick();
  			break;
  		default:
  			break;
  		}
  	}
  }
  else {
    tbContentElement.ExecCommand(ContextMenu[itemIndex].cmdId, OLECMDEXECOPT_DODEFAULT);
  }
}

// DisplayChanged handler. Very time-critical routine; this is called
// every time a character is typed. QueryStatus those toolbar buttons that need
// to be in synch with the current state of the document and update. 
function tbContentElement_DisplayChanged() {
  var i, s;
		 
  for (i=0; i<QueryStatusToolbarButtons.length; i++) {
    s = tbContentElement.QueryStatus(QueryStatusToolbarButtons[i].command);
    if (s == DECMDF_DISABLED || s == DECMDF_NOTSUPPORTED) {
      TBSetState(QueryStatusToolbarButtons[i].element, "gray"); 
    } else if (s == DECMDF_ENABLED  || s == DECMDF_NINCHED) {
       TBSetState(QueryStatusToolbarButtons[i].element, "unchecked"); 
    } else { // DECMDF_LATCHED
       TBSetState(QueryStatusToolbarButtons[i].element, "checked");
    }
  }

//  s = tbContentElement.QueryStatus(DECMD_GETBLOCKFMT);
//  if (s == DECMDF_DISABLED || s == DECMDF_NOTSUPPORTED) {
//    ParagraphStyle.disabled = true;
//  } else {
//    ParagraphStyle.disabled = false;
//    ParagraphStyle.value = tbContentElement.ExecCommand(DECMD_GETBLOCKFMT, OLECMDEXECOPT_DODEFAULT);
//  }
  s = tbContentElement.QueryStatus(DECMD_GETFONTNAME);
  if (s == DECMDF_DISABLED || s == DECMDF_NOTSUPPORTED) {
    FontName.disabled = true;
  } else {
    FontName.disabled = false;
    FontName.value = tbContentElement.ExecCommand(DECMD_GETFONTNAME, OLECMDEXECOPT_DODEFAULT);
  }
  if (s == DECMDF_DISABLED || s == DECMDF_NOTSUPPORTED) {
    FontSize.disabled = true;
  } else {
    FontSize.disabled = false;
    FontSize.value = tbContentElement.ExecCommand(DECMD_GETFONTSIZE, OLECMDEXECOPT_DODEFAULT);
  }
}

function tbContentElement_DocumentComplete() {

//    if (initialDocComplete) {
//	    if (tbContentElement.CurrentDocumentPath == "") {
//        URL_VALUE.value = "http://";
//    }
//    else {
//      URL_VALUE.value = tbContentElement.CurrentDocumentPath;
//    }
//  }

  initialDocComplete = true;
  docComplete = true;
}

function MENU_FILE_OPEN_onclick() {
  /**
    NOTE: The user is not prompted to save the the current 
    document before the call to LoadDocument. Therefore the
    user will lose any edits he has made to the current document
    after the call to LoadDocument. The purpose of the sample is
    to provide a basic demonstration of how to use the DHTMLEdit 
    control. A complete implementation would check if there were
    unsaved edits to the current document by testing the IsDirty
    property on the control. If the IsDirty property is true, the
    user should be given an opporunity to save his edits first.

    See the implementation of MENU_FILE_NEW_onclick() in this sample
    for a demonstration how to do this.
  **/

  docComplete = false;
  tbContentElement.LoadDocument("", true);
  tbContentElement.focus();
}

function MENU_FILE_SAVE_onclick() {

  if (tbContentElement.CurrentDocumentPath != "") {
    var path;
      
    path = tbContentElement.CurrentDocumentPath;

    if (path.substring(0, 7) == "http://" || path.substring(0, 7) == "file://")
      tbContentElement.SaveDocument("", true);
    else
      tbContentElement.SaveDocument(tbContentElement.CurrentDocumentPath, false);
  }
  else {
    tbContentElement.SaveDocument("", true);
  }

  URL_VALUE.value = tbContentElement.CurrentDocumentPath;

  tbContentElement.focus();
}

function MENU_FILE_SAVEAS_onclick() {
  tbContentElement.SaveDocument("", true);
  tbContentElement.focus();
}

function DECMD_VISIBLEBORDERS_onclick() {
  tbContentElement.ShowBorders = !tbContentElement.ShowBorders;
  tbContentElement.focus();
}

function DECMD_UNORDERLIST_onclick() {
  tbContentElement.ExecCommand(DECMD_UNORDERLIST,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_UNDO_onclick() {
  tbContentElement.ExecCommand(DECMD_UNDO,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_UNDERLINE_onclick() {
  tbContentElement.ExecCommand(DECMD_UNDERLINE,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_SNAPTOGRID_onclick() {
  tbContentElement.SnapToGrid = !tbContentElement.SnapToGrid;
  tbContentElement.focus();
}

function DECMD_SHOWDETAILS_onclick() {
  tbContentElement.ShowDetails = !tbContentElement.ShowDetails;
  tbContentElement.focus();
}

function DECMD_SETFORECOLOR_onclick() {
  var arr = selectColor();
  //var arr = showModalDialog( "selcolor.jsp",
  //                           "",
  //                           "font-family:Verdana; font-size:12; dialogWidth:30em; dialogHeight:30em; status:no" );

  if (arr != null) {
    tbContentElement.ExecCommand(DECMD_SETFORECOLOR,OLECMDEXECOPT_DODEFAULT, arr);
  }
}

function DECMD_SETBACKCOLOR_onclick() {
  var arr = selectColor();
  //var arr = showModalDialog( "selcolor.jsp",
  //                           "",
  //                           "font-family:Verdana; font-size:12; dialogWidth:30em; dialogHeight:30em; status:no" );

  if (arr != null) {
    tbContentElement.ExecCommand(DECMD_SETBACKCOLOR,OLECMDEXECOPT_DODEFAULT, arr);
  }
  tbContentElement.focus();
}

function DECMD_SELECTALL_onclick() {
  tbContentElement.ExecCommand(DECMD_SELECTALL,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_REDO_onclick() {
  tbContentElement.ExecCommand(DECMD_REDO,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_PASTE_onclick() {
  tbContentElement.ExecCommand(DECMD_PASTE,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_OUTDENT_onclick() {
  tbContentElement.ExecCommand(DECMD_OUTDENT,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_ORDERLIST_onclick() {
  tbContentElement.ExecCommand(DECMD_ORDERLIST,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_MAKE_ABSOLUTE_onclick() {
  tbContentElement.ExecCommand(DECMD_MAKE_ABSOLUTE,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_LOCK_ELEMENT_onclick() {
  tbContentElement.ExecCommand(DECMD_LOCK_ELEMENT,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_JUSTIFYRIGHT_onclick() {
  tbContentElement.ExecCommand(DECMD_JUSTIFYRIGHT,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_JUSTIFYLEFT_onclick() {
  tbContentElement.ExecCommand(DECMD_JUSTIFYLEFT,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_JUSTIFYCENTER_onclick() {
  tbContentElement.ExecCommand(DECMD_JUSTIFYCENTER,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_ITALIC_onclick() {
  tbContentElement.ExecCommand(DECMD_ITALIC,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_INDENT_onclick() {
  tbContentElement.ExecCommand(DECMD_INDENT,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_IMAGE_onclick(imgpath) {
//  tbContentElement.ExecCommand(DECMD_IMAGE,OLECMDEXECOPT_PROMPTUSER);
  
 //imgpath = window.parent.document.all("docimages_"+docimgnum).value;
//document.all("tbContentElement").DOM.execCommand('InsertImage', true);
 if(imgpath==""){
 	alert("请先选择所需的图片");
 }else{
 //插入图片
 	
	   var pVar = ObjTableInfo;
	   var args = new Array();
	 
	     
	  // Display table information dialog
	  args["NumRows"] = ObjTableInfo.NumRows;
	  args["NumCols"] = ObjTableInfo.NumCols;
	  args["TableAttrs"] = ObjTableInfo.TableAttrs;
	  args["CellAttrs"] = ObjTableInfo.CellAttrs;
	  args["Caption"] = ObjTableInfo.Caption;
	 
	ObjTableInfo.NumRows = "0";
	ObjTableInfo.NumCols = "0";
	 ObjTableInfo.TableAttrs = " border=0 cellPadding=0 cellSpacing=0 width=100% ";
	ObjTableInfo.Caption = "<img  src=\""+imgpath+"\">";

	tbContentElement.ExecCommand(DECMD_INSERTTABLE,OLECMDEXECOPT_DODEFAULT, pVar);  
	 oldcontent = tbContentElement.DocumentHTML;
	 tmppos = oldcontent.indexOf(imgpath);
	 startpos = oldcontent.lastIndexOf("<TABLE ",tmppos);
	 endpos = oldcontent.indexOf("</TABLE>",tmppos);	 
	   tmpstr = oldcontent.substring(startpos,endpos+8);
	   oldcontent=oldcontent.replace(tmpstr,"<IMG  src=\""+imgpath+"\">");
	  tbContentElement.DocumentHTML = oldcontent;
	  // tbContentElement.focus();
//生成新的插入图片按钮
/*	window.parent.document.all("docimages_"+docimgnum).style.display='none';
	docimgnum++;
	var oDiv = window.parent.document.createElement("div");
	var sHtml = "<input type='file' size='60' name='docimages_"+docimgnum+"' >";
	oDiv.innerHTML = sHtml;    
	window.parent.document.all("divimg").appendChild(oDiv); 
	*/
//恢复ObjTableInfo对象属性
	   ObjTableInfo.NumRows = args["NumRows"];
	  ObjTableInfo.NumCols=args["NumCols"] ;
	  ObjTableInfo.TableAttrs=args["TableAttrs"];
	  ObjTableInfo.CellAttrs=args["CellAttrs"] ;
	  ObjTableInfo.Caption=args["Caption"] ;
//重置docimages_num的值
	window.parent.document.all("docimages_num").value=docimgnum
 }
}

function DECMD_HYPERLINK_onclick() {
 tbContentElement.ExecCommand(DECMD_HYPERLINK,OLECMDEXECOPT_PROMPTUSER);
  tbContentElement.focus();
}

function DECMD_FINDTEXT_onclick() {
  tbContentElement.ExecCommand(DECMD_FINDTEXT,OLECMDEXECOPT_PROMPTUSER);
  tbContentElement.focus();
}

function DECMD_DELETE_onclick() {
  tbContentElement.ExecCommand(DECMD_DELETE,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_CUT_onclick() {
  tbContentElement.ExecCommand(DECMD_CUT,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_COPY_onclick() {
  tbContentElement.ExecCommand(DECMD_COPY,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_BOLD_onclick() {
  tbContentElement.ExecCommand(DECMD_BOLD,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function OnMenuShow(QueryStatusArray) {
  var i, s;
 
  for (i=0; i<QueryStatusArray.length; i++) {
  s = tbContentElement.QueryStatus(QueryStatusArray[i].command);
  if (s == DECMDF_DISABLED || s == DECMDF_NOTSUPPORTED) {
      TBSetState(QueryStatusArray[i].element, "gray"); 
    } else if (s == DECMDF_ENABLED  || s == DECMDF_NINCHED) {
       TBSetState(QueryStatusArray[i].element, "unchecked"); 
    } else { // DECMDF_LATCHED
       TBSetState(QueryStatusArray[i].element, "checked");
    }
  }
  tbContentElement.focus();
}

function INTRINSICS_onclick(html) {
  var selection;
  
  selection = tbContentElement.DOM.selection.createRange();
  selection.pasteHTML(html);
  tbContentElement.focus();
}

function TABLE_DELETECELL_onclick() {
  tbContentElement.ExecCommand(DECMD_DELETECELLS,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function TABLE_DELETECOL_onclick() {
  tbContentElement.ExecCommand(DECMD_DELETECOLS,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function TABLE_DELETEROW_onclick() {
  tbContentElement.ExecCommand(DECMD_DELETEROWS,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function TABLE_INSERTCELL_onclick() {
  tbContentElement.ExecCommand(DECMD_INSERTCELL,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function TABLE_INSERTCOL_onclick() {
  tbContentElement.ExecCommand(DECMD_INSERTCOL,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function TABLE_INSERTROW_onclick() {
  tbContentElement.ExecCommand(DECMD_INSERTROW,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function TABLE_INSERTTABLE_onclick() {
  InsertTable();
  tbContentElement.focus();
}

function TABLE_MERGECELL_onclick() {
  tbContentElement.ExecCommand(DECMD_MERGECELLS,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function TABLE_SPLITCELL_onclick() {
  tbContentElement.ExecCommand(DECMD_SPLITCELL,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function FORMAT_FONT_onclick() {
  tbContentElement.ExecCommand(DECMD_FONT,OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function MENU_FILE_NEW_onclick() {
  if (tbContentElement.IsDirty) {
    if (confirm("Save changes?")) {
      MENU_FILE_SAVE_onclick();
    }
  }
    URL_VALUE.value = "http://";
  tbContentElement.NewDocument();
  tbContentElement.focus();
}

function URL_VALUE_onkeypress() {
  if (event.keyCode == 13) {

  /**
    NOTE: The user is not prompted to save the the current 
    document before the call to LoadURL. Therefore the
    user will lose any edits he has made to the current document
    after the call to LoadURL. The purpose of the sample is
    to provide a basic demonstration of how to use the DHTMLEdit 
    control. A complete implementation would check if there were
    unsaved edits to the current document by testing the IsDirty
    property on the control. If the IsDirty property is true, the
    user should be given an opporunity to save his edits first.

    See the implementation of MENU_FILE_NEW_onclick() in this sample
    for a demonstration how to do this.
  **/

    docComplete = false;
    tbContentElement.LoadURL(URL_VALUE.value);
    tbContentElement.focus();
  }
}

function ZORDER_ABOVETEXT_onclick() {
  tbContentElement.ExecCommand(DECMD_BRING_ABOVE_TEXT, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function ZORDER_BELOWTEXT_onclick() {
  tbContentElement.ExecCommand(DECMD_SEND_BELOW_TEXT, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function ZORDER_BRINGFORWARD_onclick() {
  tbContentElement.ExecCommand(DECMD_BRING_FORWARD, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function ZORDER_BRINGFRONT_onclick() {
  tbContentElement.ExecCommand(DECMD_BRING_TO_FRONT, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function ZORDER_SENDBACK_onclick() {
  tbContentElement.ExecCommand(DECMD_SEND_TO_BACK, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function ZORDER_SENDBACKWARD_onclick() {
  tbContentElement.ExecCommand(DECMD_SEND_BACKWARD, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function TOOLBARS_onclick(toolbar) {
  if (toolbar.TBSTATE == "hidden") {
    TBSetState(toolbar, "dockedTop");
  } else {
    TBSetState(toolbar, "hidden");
  }
  tbContentElement.focus();
}

function ParagraphStyle_onchange() {	 
  tbContentElement.ExecCommand(DECMD_SETBLOCKFMT, OLECMDEXECOPT_DODEFAULT, ParagraphStyle.value);
  tbContentElement.focus();
}

function FontName_onchange() {
  tbContentElement.ExecCommand(DECMD_SETFONTNAME, OLECMDEXECOPT_DODEFAULT, FontName.value);
  tbContentElement.focus();
}

function FontSize_onchange() {
  tbContentElement.ExecCommand(DECMD_SETFONTSIZE, OLECMDEXECOPT_DODEFAULT, parseInt(FontSize.value));
  tbContentElement.focus();
}

function DECMD_BRINGTOFRONT_onclick() {
  tbContentElement.ExecCommand(DECMD_BRING_TO_FRONT, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_SENDTOBACK_onclick() {
  tbContentElement.ExecCommand(DECMD_SEND_TO_BACK, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_BRINGFORWARD_onclick() {
  tbContentElement.ExecCommand(DECMD_BRING_FORWARD, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_SENDBACKWARD_onclick() {
  tbContentElement.ExecCommand(DECMD_SEND_BACKWARD, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_BRINGABOVETEXT_onclick() {
  tbContentElement.ExecCommand(DECMD_BRING_ABOVE_TEXT, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function DECMD_SENDBELOWTEXT_onclick() {
  tbContentElement.ExecCommand(DECMD_SEND_BELOW_TEXT, OLECMDEXECOPT_DODEFAULT);
  tbContentElement.focus();
}

function INFO_INSERTCLASS_onclick() {
  var arg = new Array();
  var rtnValue = null;
  	if(tbContentElement.DOM.selection.type == "Control"){
  		var tr = tbContentElement.DOM.selection.createRange();
  		var curEl = tr.commonParentElement();
  		if (curEl.getAttribute("type") == "InfoClass"){
  			arg["ClassId"] = (curEl.style.getAttribute("ClassId") == null) ? "" : curEl.style.getAttribute("ClassId");
  			arg["DisplayAll"] = (curEl.style.getAttribute("DisplayAll") == null) ? "" : curEl.style.getAttribute("DisplayAll");
  			arg["DisplayPicture"] = (curEl.style.getAttribute("DisplayPicture") == null) ? "" : curEl.style.getAttribute("DisplayPicture");
  			arg["ClassNumber"] = (curEl.style.getAttribute("ClassNumber") == null) ? "" : curEl.style.getAttribute("ClassNumber");
  			arg["CellNumber"] = (curEl.style.getAttribute("CellNumber") == null) ? "" : curEl.style.getAttribute("CellNumber");
  			arg["DisplayTitle"] = (curEl.style.getAttribute("DisplayTitle") == null) ? "" : curEl.style.getAttribute("DisplayTitle");
  			arg["TitleAlign"] = (curEl.style.getAttribute("TitleAlign") == null) ? "" : curEl.style.getAttribute("TitleAlign");
  			arg["TitleFont"] = (curEl.style.getAttribute("TitleFont") == null) ? "" : curEl.style.getAttribute("TitleFont");
  			arg["TitleSize"] = (curEl.style.getAttribute("TitleSize") == null) ? "" : curEl.style.getAttribute("TitleSize");
  			arg["TitleStyle"] = (curEl.style.getAttribute("TitleStyle") == null) ? "" : curEl.style.getAttribute("TitleStyle");
  			arg["TitleColor"] = (curEl.style.getAttribute("TitleColor") == null) ? "" : curEl.style.getAttribute("TitleColor");
  			arg["ContentFont"] = (curEl.style.getAttribute("ContentFont") == null) ? "" : curEl.style.getAttribute("ContentFont");
  			arg["ContentSize"] = (curEl.style.getAttribute("ContentSize") == null) ? "" : curEl.style.getAttribute("ContentSize");
  			arg["ContentStyle"] = (curEl.style.getAttribute("ContentStyle") == null) ? "" : curEl.style.getAttribute("ContentStyle");
  			arg["ContentColor"] = (curEl.style.getAttribute("ContentColor") == null) ? "" : curEl.style.getAttribute("ContentColor");
  			arg["OddColor"] = (curEl.style.getAttribute("OddColor") == null) ? "" : curEl.style.getAttribute("OddColor");
  			arg["EvenColor"] = (curEl.style.getAttribute("EvenColor") == null) ? "" : curEl.style.getAttribute("EvenColor");
  			arg["DisplayTime"] = (curEl.style.getAttribute("DisplayTime") == null) ? "" : curEl.style.getAttribute("DisplayTime");
  			arg["ContentPicture"] = (curEl.style.getAttribute("ContentPicture") == null) ? "" : curEl.style.getAttribute("ContentPicture");
  			arg["PicturePos"] = (curEl.style.getAttribute("PicturePos") == null) ? "" : curEl.style.getAttribute("PicturePos");
  			arg["NewPicture"] = (curEl.style.getAttribute("NewPicture") == null) ? "" : curEl.style.getAttribute("NewPicture");
  			arg["MorePicture"] = (curEl.style.getAttribute("MorePicture") == null) ? "" : curEl.style.getAttribute("MorePicture");
  			arg["Width"] = (curEl.style.getAttribute("Width") == null) ? "" : curEl.style.getAttribute("Width");
  			arg["ClassTemplate"] = (curEl.style.getAttribute("ClassTemplate") == null) ? "" : curEl.style.getAttribute("ClassTemplate");
  			arg["CellTemplate"] = (curEl.style.getAttribute("CellTemplate") == null) ? "" : curEl.style.getAttribute("CellTemplate");
  		}
  	}
  rtnValue = showModalDialog("InfoClass.jsp?random=" + Math.random(),
  								arg,
								"font-family:Verdana; font-size:12; dialogWidth:500px; dialogHeight:485px; status:no");
  if (rtnValue != null){
  	  var tagText = "<img type=\"InfoClass\" src=\"/InfoRelease/resource/images/class.jpg\" style=\"color:red";
  	  for (elem in rtnValue){
  	  	if (rtnValue[elem] != null && rtnValue[elem] != ""){
  	  		tagText = tagText + "; " + elem + ":" + rtnValue[elem];
  	  	}
  	  }
  	  tagText = tagText + "\">";
  	  if (tbContentElement.DOM.selection.type != "None"){
  	  	tbContentElement.ExecCommand(DECMD_DELETE, OLECMDEXECOPT_DODEFAULT);
  	  }
	  var doc = tbContentElement.DOM;
	  var selection = doc.selection;
	  var tr = selection.createRange();
	  //alert(tagText);
	  tr.pasteHTML(tagText);
  }
  tbContentElement.focus();
}

function INFO_INSERTSCROLL_onclick() {
  var arg = new Array();
  var rtnValue = null;
  	if(tbContentElement.DOM.selection.type == "Control"){
  		var tr = tbContentElement.DOM.selection.createRange();
  		var curEl = tr.commonParentElement();
  		if (curEl.getAttribute("type") == "InfoScroll"){
  			arg["ClassId"] = (curEl.style.getAttribute("ClassId") == null) ? "" : curEl.style.getAttribute("ClassId");
  			arg["CellNumber"] = (curEl.style.getAttribute("CellNumber") == null) ? "" : curEl.style.getAttribute("CellNumber");
  			arg["ScrollDirection"] = (curEl.style.getAttribute("ScrollDirection") == null) ? "" : curEl.style.getAttribute("ScrollDirection");
  			arg["ContentFont"] = (curEl.style.getAttribute("ContentFont") == null) ? "" : curEl.style.getAttribute("ContentFont");
  			arg["ContentSize"] = (curEl.style.getAttribute("ContentSize") == null) ? "" : curEl.style.getAttribute("ContentSize");
  			arg["ContentStyle"] = (curEl.style.getAttribute("ContentStyle") == null) ? "" : curEl.style.getAttribute("ContentStyle");
  			arg["ContentColor"] = (curEl.style.getAttribute("ContentColor") == null) ? "" : curEl.style.getAttribute("ContentColor");
  			arg["BackColor"] = (curEl.style.getAttribute("BackColor") == null) ? "" : curEl.style.getAttribute("BackColor");
  			arg["BackPicture"] = (curEl.style.getAttribute("BackPicture") == null) ? "" : curEl.style.getAttribute("BackPicture");
  			arg["Width"] = (curEl.style.getAttribute("Width") == null) ? "" : curEl.style.getAttribute("Width");
  			arg["Height"] = (curEl.style.getAttribute("Height") == null) ? "" : curEl.style.getAttribute("Height");
  			arg["CellTemplate"] = (curEl.style.getAttribute("CellTemplate") == null) ? "" : curEl.style.getAttribute("CellTemplate");
  		}
  	}
  rtnValue = showModalDialog("InfoScroll.jsp?random=" + Math.random(),
  								arg,
								"font-family:Verdana; font-size:12; dialogWidth:490px; dialogHeight:280px; status:no");
  if (rtnValue != null){
  	  var tagText = "<img type=\"InfoScroll\" src=\"/InfoRelease/resource/images/scroll.jpg\" style=\"color:red";
  	  for (elem in rtnValue){
  	  	if (rtnValue[elem] != null && rtnValue[elem] != ""){
  	  		tagText = tagText + "; " + elem + ":" + rtnValue[elem];
  	  	}
  	  }
  	  tagText = tagText + "\">";
  	  if (tbContentElement.DOM.selection.type != "None"){
  	  	tbContentElement.ExecCommand(DECMD_DELETE, OLECMDEXECOPT_DODEFAULT);
  	  }
	  var doc = tbContentElement.DOM;
	  var selection = doc.selection;
	  var tr = selection.createRange();
	  //alert(tagText);
	  tr.pasteHTML(tagText);
  }
  tbContentElement.focus();
}

function INFO_INSERTSTATIC_onclick() {
  var arg = new Array();
  var rtnValue = null;
  	if(tbContentElement.DOM.selection.type == "Control"){
  		var tr = tbContentElement.DOM.selection.createRange();
  		var curEl = tr.commonParentElement();
  		if (curEl.getAttribute("type") == "Static"){
  			arg["FileName"] = (curEl.style.getAttribute("FileName") == null) ? "" : curEl.style.getAttribute("FileName");
  			arg["Width"] = (curEl.style.getAttribute("Width") == null) ? "" : curEl.style.getAttribute("Width");
  			arg["Height"] = (curEl.style.getAttribute("Height") == null) ? "" : curEl.style.getAttribute("Height");
  		}
  	}
  rtnValue = showModalDialog("Static.jsp?random=" + Math.random(),
  								arg,
								"font-family:Verdana; font-size:12; dialogWidth:220px; dialogHeight:180px; status:no");
  if (rtnValue != null){
  	  var tagText = "<img type=\"Static\" src=\"/InfoRelease/resource/images/static.jpg\" style=\"color:red";
  	  for (elem in rtnValue){
  	  	if (rtnValue[elem] != null && rtnValue[elem] != ""){
  	  		tagText = tagText + "; " + elem + ":" + rtnValue[elem];
  	  	}
  	  }
  	  tagText = tagText + "\">";
  	  if (tbContentElement.DOM.selection.type != "None"){
  	  	tbContentElement.ExecCommand(DECMD_DELETE, OLECMDEXECOPT_DODEFAULT);
  	  }
	  var doc = tbContentElement.DOM;
	  var selection = doc.selection;
	  var tr = selection.createRange();
	  //alert(tagText);
	  tr.pasteHTML(tagText);
  }
  tbContentElement.focus();
}

function INFO_INSERTFLOAT_onclick() {
  var arg = new Array();
  var rtnValue = null;
  	if(tbContentElement.DOM.selection.type == "Control"){
  		var tr = tbContentElement.DOM.selection.createRange();
  		var curEl = tr.commonParentElement();
  		if (curEl.getAttribute("type") == "Float"){
  			arg["FloatType"] = (curEl.style.getAttribute("FloatType") == null) ? "" : curEl.style.getAttribute("FloatType");
  			arg["Width"] = (curEl.style.getAttribute("Width") == null) ? "" : curEl.style.getAttribute("Width");
  			arg["Height"] = (curEl.style.getAttribute("Height") == null) ? "" : curEl.style.getAttribute("Height");
  			arg["MoveSpeech"] = (curEl.style.getAttribute("MoveSpeech") == null) ? "" : curEl.style.getAttribute("MoveSpeech");
  			arg["FloatLeft"] = (curEl.style.getAttribute("FloatLeft") == null) ? "" : curEl.style.getAttribute("FloatLeft");
  			arg["FloatTop"] = (curEl.style.getAttribute("FloatTop") == null) ? "" : curEl.style.getAttribute("FloatTop");
  			arg["FloatLink"] = (curEl.style.getAttribute("FloatLink") == null) ? "" : curEl.style.getAttribute("FloatLink");
  			arg["FileName"] = (curEl.style.getAttribute("FileName") == null) ? "" : curEl.style.getAttribute("FileName");
  		}
  	}
  rtnValue = showModalDialog("Float.jsp?random=" + Math.random(),
  								arg,
								"font-family:Verdana; font-size:12; dialogWidth:420px; dialogHeight:210px; status:no");
  if (rtnValue != null){
  	  var tagText = "<img type=\"Float\" src=\"/InfoRelease/resource/images/float.jpg\" style=\"color:red";
  	  for (elem in rtnValue){
  	  	if (rtnValue[elem] != null && rtnValue[elem] != ""){
  	  		tagText = tagText + "; " + elem + ":" + rtnValue[elem];
  	  	}
  	  }
  	  tagText = tagText + "\">";
  	  if (tbContentElement.DOM.selection.type != "None"){
  	  	tbContentElement.ExecCommand(DECMD_DELETE, OLECMDEXECOPT_DODEFAULT);
  	  }
	  var doc = tbContentElement.DOM;
	  var selection = doc.selection;
	  var tr = selection.createRange();
	  //alert(tagText);
	  tr.pasteHTML(tagText);
  }
  tbContentElement.focus();
}

function INFO_INSERTCELL_onclick() {
  var arg = new Array();
  var rtnValue = null;
  	if(tbContentElement.DOM.selection.type == "Control"){
  		var tr = tbContentElement.DOM.selection.createRange();
  		var curEl = tr.commonParentElement();
  		if (curEl.getAttribute("type") == "InfoCell"){
  			//alert(curEl.outerHTML);
  			arg["UnitType"] = (curEl.style.getAttribute("UnitType") == null) ? "" : curEl.style.getAttribute("UnitType");
  			arg["UnitFont"] = (curEl.style.getAttribute("UnitFont") == null) ? "" : curEl.style.getAttribute("UnitFont");
  			arg["ContentSize"] = (curEl.style.getAttribute("ContentSize") == null) ? "" : curEl.style.getAttribute("ContentSize");
  			arg["ContentStyle"] = (curEl.style.getAttribute("ContentStyle") == null) ? "" : curEl.style.getAttribute("ContentStyle");
  			arg["FontColor"] = (curEl.style.getAttribute("FontColor") == null) ? "" : curEl.style.getAttribute("FontColor");
  			arg["BackColor"] = (curEl.style.getAttribute("BackColor") == null) ? "" : curEl.style.getAttribute("BackColor");
  			arg["BackPicture"] = (curEl.style.getAttribute("BackPicture") == null) ? "" : curEl.style.getAttribute("BackPicture");
  		}
  	}
  rtnValue = showModalDialog("InfoCell.jsp?random=" + Math.random(),
  								arg,
								"font-family:Verdana; font-size:12; dialogWidth:450px; dialogHeight:200px; status:no");
  if (rtnValue != null){
  	  var tagText = "<img type=\"InfoCell\" src=\"/InfoRelease/resource/images/cell.jpg\" style=\"color:red";
  	  for (elem in rtnValue){
  	  	if (rtnValue[elem] != null && rtnValue[elem] != ""){
  	  		tagText = tagText + "; " + elem + ":" + rtnValue[elem];
  	  	}
  	  }
  	  tagText = tagText + "\">";
  	  if (tbContentElement.DOM.selection.type != "None"){
  	  	tbContentElement.ExecCommand(DECMD_DELETE, OLECMDEXECOPT_DODEFAULT);
  	  }
	  var doc = tbContentElement.DOM;
	  var tr = doc.selection.createRange();
	  //alert(tagText);
	  tr.pasteHTML(tagText);
  }
  tbContentElement.focus();
}

//初始化Html代码
function setHtml(sHtml, sBaseUrl){
	tbContentElement.DocumentHTML = sHtml;
	tbContentElement.BaseURL = sBaseUrl;
	//alert(sBaseUrl);
}

function setContent(sContent, sBaseUrl) {
	tbContentElement.DocumentHTML = sContent;
	tbContentElement.BaseURL = sBaseUrl;
}
function getHtml(){
	return tbContentElement.FilterSourceCode(tbContentElement.DocumentHTML);
}

function getContent(){
	var content = tbContentElement.FilterSourceCode(tbContentElement.dom.body.innerHTML);
	if (content.toLowerCase() == "<div></div>") {
		return "";
	}
	else {
		return content;
	}
}

function getJsp(){
	tbSave.DocumentHTML = "<?xml:namespace prefix=\"info\">" + tbContentElement.DocumentHTML;
	while(tbSave.Busy){
		sleep(100);
	}
	//alert(tbSave.DOM.images.length);
	//alert(tbSave.DOM.all.tags("img").length);
	var imgs = tbSave.DOM.images;
	var stag = "";
	var length = imgs.length;
	for (var i = imgs.length - 1; i >= 0; i--){
		stag = "";
		var curEl = imgs.item(i,0);
		//alert("imgs.item("+i+",0) of "+imgs.length+":"+curEl.outerHTML);
		switch (curEl.getAttribute("type")){
		case "InfoClass":
			stag = "<info:InfoClass type=InfoClass";
  			stag += (" classid=" + curEl.style.getAttribute("ClassId"));
  			stag += (curEl.style.getAttribute("DisplayAll") == null) ? "" : (" displayall=" + curEl.style.getAttribute("DisplayAll"));
  			stag += (curEl.style.getAttribute("DisplayPicture") == null) ? "" : (" displaypicture=" + curEl.style.getAttribute("DisplayPicture"));
  			stag += (curEl.style.getAttribute("ClassNumber") == null) ? "" : (" classnumber=" + curEl.style.getAttribute("ClassNumber"));
  			stag += (curEl.style.getAttribute("CellNumber") == null) ? "" : (" cellnumber=" + curEl.style.getAttribute("CellNumber"));
  			stag += (curEl.style.getAttribute("DisplayTitle") == null) ? "" : (" displaytitle=" + curEl.style.getAttribute("DisplayTitle"));
  			stag += (curEl.style.getAttribute("TitleAlign") == null) ? "" : (" titlealign=" + curEl.style.getAttribute("TitleAlign"));
  			stag += (curEl.style.getAttribute("TitleFont") == null) ? "" : (" titlefont=" + curEl.style.getAttribute("TitleFont"));
  			stag += (curEl.style.getAttribute("TitleSize") == null) ? "" : (" titlesize=" + curEl.style.getAttribute("TitleSize"));
  			stag += (curEl.style.getAttribute("TitleStyle") == null) ? "" : (" titlestyle=" + curEl.style.getAttribute("TitleStyle"));
  			stag += (curEl.style.getAttribute("TitleColor") == null) ? "" : (" titlecolor=" + curEl.style.getAttribute("TitleColor"));
  			stag += (curEl.style.getAttribute("ContentFont") == null) ? "" : (" contentfont=" + curEl.style.getAttribute("ContentFont"));
  			stag += (curEl.style.getAttribute("ContentSize") == null) ? "" : (" contentsize=" + curEl.style.getAttribute("ContentSize"));
  			stag += (curEl.style.getAttribute("ContentStyle") == null) ? "" : (" contentstyle=" + curEl.style.getAttribute("ContentStyle"));
  			stag += (curEl.style.getAttribute("ContentColor") == null) ? "" : (" contentcolor=" + curEl.style.getAttribute("ContentColor"));
  			stag += (curEl.style.getAttribute("OddColor") == null) ? "" : (" oddcolor=" + curEl.style.getAttribute("OddColor"));
  			stag += (curEl.style.getAttribute("EvenColor") == null) ? "" : (" evencolor=" + curEl.style.getAttribute("EvenColor"));
  			stag += (curEl.style.getAttribute("DisplayTime") == null) ? "" : (" displaytime=" + curEl.style.getAttribute("DisplayTime"));
  			stag += (curEl.style.getAttribute("ContentPicture") == null) ? "" : (" contentpicture=" + curEl.style.getAttribute("ContentPicture"));
  			stag += (curEl.style.getAttribute("PicturePos") == null) ? "" : (" picturepos=" + curEl.style.getAttribute("PicturePos"));
  			stag += (curEl.style.getAttribute("NewPicture") == null) ? "" : (" newpicture=" + curEl.style.getAttribute("NewPicture"));
  			stag += (curEl.style.getAttribute("MorePicture") == null) ? "" : (" morepicture=" + curEl.style.getAttribute("MorePicture"));
  			stag += (curEl.style.getAttribute("Width") == null) ? "" : (" width=" + curEl.style.getAttribute("Width"));
  			stag += (curEl.style.getAttribute("ClassTemplate") == null) ? "" : (" classtemplate=" + curEl.style.getAttribute("ClassTemplate"));
  			stag += (curEl.style.getAttribute("CellTemplate") == null) ? "" : (" celltemplate=" + curEl.style.getAttribute("CellTemplate"));
			stag += "></jsp:InfoClass>";
			//alert(stag);
			curEl.outerHTML = stag;
			break;
		case "InfoCell":
			stag = "<info:InfoCell type=\"InfoCell\"";
  			stag += ("unittype=" + curEl.style.getAttribute("UnitType"));
  			stag += (curEl.style.getAttribute("UnitFont") == null) ? "" : (" unitfont=" + curEl.style.getAttribute("UnitFont"));
  			stag += (curEl.style.getAttribute("ContentSize") == null) ? "" : (" fontsize=" + curEl.style.getAttribute("ContentSize"));
  			stag += (curEl.style.getAttribute("ContentStyle") == null) ? "" : (" fontstyle=" + curEl.style.getAttribute("ContentStyle"));
  			stag += (curEl.style.getAttribute("FontColor") == null) ? "" : (" fontcolor=" + curEl.style.getAttribute("FontColor"));
  			stag += (curEl.style.getAttribute("BackColor") == null) ? "" : (" backcolor=" + curEl.style.getAttribute("BackColor"));
  			stag += (curEl.style.getAttribute("BackPicture") == null) ? "" : (" backpicture=" + curEl.style.getAttribute("BackPicture"));
			stag += "></jsp:InfoCell>";
			//alert(stag);
			curEl.outerHTML = stag;
			break;
		case "InfoScroll":
			stag = "<info:InfoScroll type=\"InfoScroll\"";
  			stag += ("classid=" + curEl.style.getAttribute("ClassId"));
  			stag += (curEl.style.getAttribute("CellNumber") == null) ? "" : (" cellnumber=" + curEl.style.getAttribute("CellNumber"));
  			stag += (curEl.style.getAttribute("ScrollDirection") == null) ? "" : (" scrolldirection=" + curEl.style.getAttribute("ScrollDirection"));
  			stag += (curEl.style.getAttribute("ContentFont") == null) ? "" : (" contentfont=" + curEl.style.getAttribute("ContentFont"));
  			stag += (curEl.style.getAttribute("ContentSize") == null) ? "" : (" contentsize=" + curEl.style.getAttribute("ContentSize"));
  			stag += (curEl.style.getAttribute("ContentStyle") == null) ? "" : (" contentstyle=" + curEl.style.getAttribute("ContentStyle"));
  			stag += (curEl.style.getAttribute("ContentColor") == null) ? "" : (" contentcolor=" + curEl.style.getAttribute("ContentColor"));
  			stag += (curEl.style.getAttribute("BackColor") == null) ? "" : (" backcolor=" + curEl.style.getAttribute("BackColor"));
  			stag += (curEl.style.getAttribute("BackPicture") == null) ? "" : (" backpicture=" + curEl.style.getAttribute("BackPicture"));
  			stag += (curEl.style.getAttribute("Width") == null) ? "" : (" width=" + curEl.style.getAttribute("Width"));
  			stag += (curEl.style.getAttribute("Height") == null) ? "" : (" height=" + curEl.style.getAttribute("Height"));
  			stag += (curEl.style.getAttribute("CellTemplate") == null) ? "" : (" celltemplate=" + curEl.style.getAttribute("CellTemplate"));
			stag += "></jsp:InfoScroll>";
			//alert(stag);
			curEl.outerHTML = stag;
			break;
		case "Static":
			stag = "<info:Static type=\"Static\"";
  			stag += (curEl.style.getAttribute("Width") == null) ? "" : (" width=" + curEl.style.getAttribute("Width"));
  			stag += (curEl.style.getAttribute("Height") == null) ? "" : (" height=" + curEl.style.getAttribute("Height"));
  			stag += (curEl.style.getAttribute("FileName") == null) ? "" : (" filename=" + curEl.style.getAttribute("FileName"));
			stag += "></jsp:Static>";
			//alert(stag);
			curEl.outerHTML = stag;
			break;
		case "Float":
			stag = "<info:Float type=\"Float\"";
  			stag += ("floattype=" + curEl.style.getAttribute("FloatType"));
  			stag += (curEl.style.getAttribute("MoveSpeech") == null) ? "" : (" movespeech=" + curEl.style.getAttribute("MoveSpeech"));
  			stag += (curEl.style.getAttribute("FloatLeft") == null) ? "" : (" floatleft=" + curEl.style.getAttribute("FloatLeft"));
  			stag += (curEl.style.getAttribute("FloatTop") == null) ? "" : (" floattop=" + curEl.style.getAttribute("FloatTop"));
  			stag += (curEl.style.getAttribute("FloatLink") == null) ? "" : (" floatlink=" + curEl.style.getAttribute("FloatLink"));
  			stag += (curEl.style.getAttribute("Width") == null) ? "" : (" width=" + curEl.style.getAttribute("Width"));
  			stag += (curEl.style.getAttribute("Height") == null) ? "" : (" height=" + curEl.style.getAttribute("Height"));
  			stag += (curEl.style.getAttribute("FileName") == null) ? "" : (" filename=" + curEl.style.getAttribute("FileName"));
			stag += "></jsp:Float>";
			//alert(stag);
			curEl.outerHTML = stag;
			break;
		default:
			break;
		}
	}
	var jspCode = tbSave.FilterSourceCode(tbSave.DocumentHTML);
	jspCode = jspCode.substr(30);
	jspCode = "<%@ taglib uri=\"/info.tld\" prefix=\"info\" %>\n" + jspCode;
	jspCode = "<%@ page contentType=\"text/html; charset=GBK\" %>\n" + jspCode;
	return jspCode;
}

//延时函数，参数为延时秒数。
function sleep(milliSeconds){
	showModalDialog("/WebCustom/gwp/controller?nextpage=sleep&command=&canexecute=false",milliSeconds,"dialogWidth:15; dialogHeight:1; status:no");
}

function IsDigit() {
  return ((event.keyCode >= 48) && (event.keyCode <= 57))
}

//得到字体样式
function getFontStyle(sBolb, sItalic, sUnderLine, sStrikeThrough){
	var a = sBolb.checked;
	var b = sItalic.checked;
	var c = sUnderLine.checked;
	var d = sStrikeThrough.checked;
	var res1="", res2="";
	if (a==false && b==false)
		res1 = "0";
	else if(a==true && b==false)
		res1 = "1";
	else if(a==false && b==true)
		res1 = "2";
	else if(a==true && b==true)
		res1 = "3";
		
	if(c==false && d==false)
		res2 = "0";
	else if(c==true && d==false)
		res2 = "1";
	else if(c==false && d==true)
		res2 = "2";
	else if(c==true && d==true)
		res2 = "3";
		
	return res1 + res2;
}

//设置字体样式
function setFontStyle(sStyle, sBolb, sItalic, sUnderLine, sStrikeThrough){
	var res1=sStyle.substr(0,1), res2=sStyle.substr(1);
	if (res1 == "0"){
		sBolb.checked = false;
		sItalic.checked = false;
	}
	else if(res1 == "1"){
		sBolb.checked = true;
		sItalic.checked = false;
	}
	else if(res1 == "2"){
		sBolb.checked = false;
		sItalic.checked = true;
	}
	else if(res1 == "3"){
		sBolb.checked = true;
		sItalic.checked = true;
	}
	
	if(res2 == "0"){
		sUnderLine.checked = false;
		sStrikeThrough.checked = false;
	}
	else if(res2 == "1"){
		sUnderLine.checked = true;
		sStrikeThrough.checked = false;
	}
	else if(res2 == "2"){
		sUnderLine.checked = false;
		sStrikeThrough.checked = true;
	}
	else if(res2 == "3"){
		sUnderLine.checked = true;
		sStrikeThrough.checked = true;
	}
}

function setColor(sOldColor, sControl){
	var getColor = selectColor(sOldColor);
	if (getColor != null && getColor != ""){
		sControl.value = getColor;
		sControl.style.backgroundColor = getColor;
//		alert(sControl.outerHTML);
	}
}

//选择颜色函数
function selectColor(sColor){
	return showModalDialog("setcolor.htm", sColor, "dialogWidth:400px; dialogHeight:350px; status:no;");
//	if (sColor.indexOf("#") >= 0)
//		sColor = sColor.substr(sColor.indexOf("#") + 1);
//	sColor = "0x" + sColor;
//	var sColorInt = parseInt(sColor);
//	alert(sColorInt);
//	commonColor.Color = sColor;
//	commonColor.ShowColor();
//	alert(commonColor.Color);
}

//选择文件函数。
function selFile(sControl, sFilter, sType){
	sType = (sType != null && sType == "check") ? "check" : "radio";
	var rtnValue = window.showModalDialog("/WebCustom/control/GetFileSelectTreeCommand?ExtendName=" + sFilter + "&type=" + sType + "&tmp=" + Math.random(), "", "dialogWidth:350px; dialogHeight:450px; status:no; center:yes; scroll:no");
	if (rtnValue != null) {
		sControl.value = "/" + rtnValue;
	}
/*	var rtnvalue = showModalDialog("GetImage.jsp?filter=" + sFilter,
									sControl.value,
									"dialogWidth:500px; dialogHeight:400px; status:no");
	if (rtnvalue != null) {
		sControl.value = unescape(rtnvalue);
	}*/
}

//选择JSP、HTM文件
function selLinkFile(sControl, sFilter, sRoot){
	sControl.value = showModalDialog("/InfoRelease/help/fileTree.jsp?filter=" + sFilter + "&RootPath=" + sRoot,
									sControl.value,
									"dialogWidth:500px; dialogHeight:400px; status:no");
}

function selectClassPop(helpurl,sname){
	var url = "/InfoRelease/help/" + helpurl;
	//alert(url);
	var sValue = new Array(2);
	sValue = showModalDialog(url,"1","dialogWidth:450px;dialogHeight:430px;center:1;status:0");
	if(sValue != null){
		document.getElementsByName(sname)[0].value = sValue[1];
	}
}
