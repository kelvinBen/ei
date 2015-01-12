$.extend(EDITGRID.prototype,{reload:function(jsonstr, cxtPath, gridname){
						this.gridObj = jsonstr;
						var xmlHttp_Js = null;
						var xmlHttp_Template = null;
						if (window.ActiveXObject) {
							xmlHttp_Js = new ActiveXObject("Microsoft.XMLHTTP");
							xmlHttp_Template = new ActiveXObject("Microsoft.XMLHTTP");
						} else if (window.XMLHttpRequest) {
							xmlHttp_Js = new XMLHttpRequest();
							xmlHttp_Template = new XMLHttpRequest();
						};
						xmlHttp_Js.onreadystatechange = function() {
							if (xmlHttp_Js.readyState == 4)
								if (xmlHttp_Js.status == 200) {
									window.execScript(xmlHttp_Js.responseText, "JavaScript");
									delete xmlHttp_Js;
									xmlHttp_Js = null;
									CollectGarbage();
								};
						};
						xmlHttp_Js.open("GET", cxtPath + "/template.js", false);
						xmlHttp_Js.send();
						xmlHttp_Template.onreadystatechange = function() {
							if (xmlHttp_Template.readyState == 4)
								if (xmlHttp_Template.status == 200) {
									var template = TrimPath.parseTemplate(
											xmlHttp_Template.responseText, null);
									delete xmlHttp_Template;
									xmlHttp_Template = null;
									delete TrimPath;
									$("#grid3").replaceWith(template.process(jsonstr, null));
									template = null;
									CollectGarbage();
								};
						};
						xmlHttp_Template
								.open("GET", cxtPath + "/templates/editgrid.jsp", false);
						xmlHttp_Template.send();
					
				}});