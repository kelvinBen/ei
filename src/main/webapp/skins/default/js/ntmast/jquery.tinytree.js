/*
 * name: jquery.tinytree.js
 *
 * Copyright (c) 2009
 * Examples and docs at: http://tablesorter.com
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * 
 * $author: huang weijian(��ΰ��)$
 * $Date: 2009/08/08 07:10:37 $
 * $Contact: alvin.huang.wj@gmail.com$
 */

 /**
 * һ������jQuery��tree�ؼ�, ֧���첽����
 * 
 * @author huang weijian(alvin.huang.wj@gmail.com)
 */
;(function($) {
	
	var classNames = {
		tinytree : 'tinytree',
		open : "open",
		closed : "closed",
		expandable : "expandable",
		collapsable : "collapsable",
		lastCollapsable : "lastCollapsable",
		lastExpandable : "lastExpandable",
		last : "last",
		file : "file",
		closedfolder : "closedfolder",
		openfolder : "openfolder",
		hitarea : "hitarea",
		checkbox : "checkbox",
		selected : 'selected',
		
		_leafHref : "_leafHref",
		_compositeHref : '_compositeHref'
	};
	
	/**
	 * �����첽��, ͨ����һ�εõ�������Ϣ����
	 * 
	 * @param {Element}
	 *            container �첽����HTML DOM����
	 * @param {Object}
	 *            settings ������Ϣ
	 */
	$.buildTinyTree = function(container, settings) {
		
		var $container = $(container);
		
		var tipDivIdPrefix = '_tinytree_tip_';
		var nodeIdPrefix = '_tinytree_node_';
		var hasLoadedChildrenCache = [];
		
		/**
		 * Ĭ������
		 */
		var defaults = {
			root : '0', // ���ڵ��ID
			
			autoload : true, // �Ƿ��Զ����ص�һ���ڵ�
			
			url : false, // ajax url
			method : 'GET', // POST ���� GET
			dataType : 'xml', // ����url��õ������ݸ�ʽ 'xml' or 'json'
			
			loadingMessage : '<font color="red" size="2">���ڼ���...</font>',			
			timeToShowLoadingMessage : false, // �ӳ���ʾ������ʾ��Ϣ��ʱ��, ��λΪ: ��
			
			// javascript�ĸ�ʽ��javascript:method, �ش�(nodeId, nodeName)
			nodeUrl : false, // �ڵ㴥�����¼�, ֧��http��javascript:���ַ�ʽ
			target : 'contentFrame', // �¼�������Ŀ��
			
			filter : false, // �Ƿ���ʾ���˿�?
			showChildren : false,	//�Ƿ�ͬʱ��ʾ���˺�Ľڵ�ĺ����
			
			closeSameLevel : false, // ���򿪸ýڵ�ʱ���Ƿ�ر�ͬ���Ľڵ�
			
			radioSupport : false,		//��ѡ
    		checkboxSupport : false,	//��ѡ
    		radioButLeafCheckboxSupport : false, // ��ѡ����Ҷ�ӽڵ�Ϊ��ѡ
    		inputName : 'tinytreeInputName', //��ѡ��ѡinput��name����
    		selectLeafOnly  : false,	//ֻѡ��Ҷ�ڵ�
    		clickNodeToCheckRadioOrCheckbox : false, // ����ڵ��Ƿ�ѡradio��checkbox
    		
    		alsoCheckParent	: false,	//�Ƿ�ͬʱ��ѡ���ڵ�
    		alsoCheckChildren : false, //�Ƿ�ͬʱ��ѡ�ӽڵ�
    
    		openAllNodes : false, // �Ƿ����ʱ�����е��Ѽ��ع��Ľڵ�?
    		
			onError : false, // �Ӻ�̨�������ݳ���ʱ����function onError(nodes)
			onSuccess : false,	//������ɺ�ص�  
			
			hiddenNodeClass : 'hiddenNode',
			
			// private, don't set these values by yourself
			_haveLoaded : false, // �Ƿ��Ѿ��˼�������, �����ӳ���ʾ������ʾ��Ϣ
			_firstLoaded : true  // �Ƿ��ǵ�һ�μ���? 
		};
		settings = $.extend({}, defaults, settings);
		
		var gdiv = document.createElement('div');
		gdiv.id = generateNodeId(settings.root);
		gdiv.className = classNames.tinytree;
		$gdiv = $(gdiv);
		
		$container.append(gdiv)
		if (settings.filter) {
			$gdiv.append(createFilterDivHtml());
			bindFilterEvent();
		}
		$gdiv.append(createTipDivHtml(settings.root));
		
		var tinytree = {
			/**
			 * �����¼���
			 */
			buildLowerTree : function(parentId) {
				if (!settings.url) {
					return;
				}
				var timeout = settings.timeToShowLoadingMessage;
				if (timeout) {
					window.setTimeout(function(parentId) {
						if (!settings._haveLoaded) {
							showTipMessage(parentId);
						}
					}, (timeout * 1000));
				} else {
					showTipMessage(parentId);
				}
				
				//hasLoadedChildrenCache.push(parentId);
				var param = [{name:'parentId', value:parentId}];
				$.ajax({
					type : settings.method,
					url : settings.url,
					data : param,
					dataType : settings.dataType,
					success : function(nodes) {
						settings._haveLoaded = true;
						tinytree.addNodes(parentId, nodes);
						settings._firstLoaded = false;
						if(settings.onSuccess) {
							settings.onSuccess(); 
						}
					},
					error : function(nodes) {
						settings._haveLoaded = true;
						try {
							if (settings.onError) {
								settings.onError(nodes);
							}
						} catch (e) {}
					}
				});
			},
			
			/**
			 * �������ڵ�ӵ�ָ����ĳ�ڵ���
			 */
			addNodes : function(parentId, nodes) {
				hideTipMessage(parentId);
				if (settings.dataType == 'xml') {
					parseXmlNodes(parentId, nodes);
				} else {
					parseJsonNodes(parentId, nodes);
				}
				if (settings._firstLoaded && settings.openAllNodes) {
					tinytree.openAll();
				}
			},
			
			/**
			 * �õ�radio/checkbox��ѡ�еĽڵ���Ϣ
			 * 
			 * @return {Array} ѡ�еĽڵ���Ϣ[{nodeId:'xx', nodeName:'xx'}]
			 */
			getSelecetedNodes : function() {
				var $checkeds = $(':checkbox:checked,:radio:checked', gdiv);
				var result = [];
				$.each($checkeds, function(i, checked) {
					var $checked = $(checked);
					result.push({
						nodeId : $checked.attr('treeNodeId'),
						nodeName : $checked.attr('treeNodeName')
					});
				});
				return result;
			},
			
			/**
			 * չ�������ѱ����ع��Ľڵ�
			 */
			openAll : function() {
				justOpenNodes(hasLoadedChildrenCache);
			},
			/**
			 * �ر����еĽڵ�
			 */
			closeAll : function() {
				justCloseNodes(hasLoadedChildrenCache);
			},
			
			/**
			 * ����ָ���Ľڵ���(filterValue)���˽ڵ�
			 * 
			 * @param {String}
			 *            Ҫ���й��˵Ľڵ���
			 */
			doFilter : function(filterValue) {
				filterValue = filterValue ? $.trim(filterValue) : '';
				if (filterValue) {
					// ����ƥ��Ľڵ�
					var $matchedAs = $('li > span[link] a:contains("' + filterValue + '")', gdiv);
					highlight($matchedAs);
					// ��ʾƥ��Ľڵ㲢����ûƥ��Ľڵ�
					var $matchedLis = $matchedAs.parent();
					$('li', gdiv).not($matchedLis).hide();
					$matchedLis.show();
					
					// չ�����ڵ�
					var $parents = $matchedLis.parents('li');
					$parents.show();
					tinytree.closeAll();
					justOpenNodes(getNodeIds($parents));
					
					// ��ʾ���˺�Ľڵ�ĺ��
					if (settings.showChildren) {
						justOpenNodes(getNodeIds($matchedLis));
						$('li', $matchedLis).show();
					}
				} else { // ��������Ϊ��ʱ
					// ȡ������, ����ʾ���нڵ�
					unhighlight();
					$('li', gdiv).show();	
				}				
			},
			
			/**
			 * ��λ, ����ָ���Ľڵ�
			 */
			position : function(nodeId) {
				var $matched = $('#' + generateNodeId(nodeId) + ' > span[link] a', gdiv);
				justOpenNodes(getNodeIds($matched.parents('li')));
				highlight($matched);
			},
			
			/**
			 * ����ָ���Ľڵ�
			 */
			click : function(nodeId) {
				tinytree.position(nodeId);
				var $matched = $('#' + generateNodeId(nodeId) + ' > span[link] a', gdiv);
				$matched.click();
			},
			
			/**
			 * ���¼���ָ���Ľڵ���¼��ڵ�
			 */
			reload : function(nodeId) {
				if (nodeId) {
					delete hasLoadedChildrenCache[$.inArray(nodeId, hasLoadedChildrenCache)];
					var nodeElemId = generateNodeId(nodeId);
					$('#' + nodeElemId + ' ul', gdiv).remove();
					tinytree.buildLowerTree(nodeId);
					changeToCollapsableClass(nodeId);
				} else {
					hasLoadedChildrenCache = [];
					$('ul', gdiv).remove();
					tinytree.buildLowerTree(settings.root);
				}
			},
			
			showAllHiddenNode : function() {
				$('ul li[hide]', gdiv).show();
			},
			
			hideAllHiddenNode : function() {
				$('ul li[hide]', gdiv).hide();
			}
		};
		
		//-------------------------------------------------
		if (settings.autoload) {
			tinytree.buildLowerTree(settings.root);
		}
		//make tinytree functions accessible
		container.tinytree = tinytree;
		container.settings = settings;
		
		//--------------------private-----------------------
		/**
		 * Node�ڵ�
		 */
		function Node(nodeId, nodeName, parentId, url, checked, disabled, leaf, hide) {
			this.nodeId = nodeId;
			this.nodeName = nodeName;
			this.parentId = parentId;
			this.url = url || false;
			this.checked = checked || false;
			this.disabled = disabled || false;
			this.leaf = leaf || false;
			this.hide = hide || false;
		}
		
		function createTipDivHtml(parentId) {
			return '<div id="' + tipDivIdPrefix + parentId 
						+ '" class="tip" style="display: none;">'
						+ settings.loadingMessage + '</div>';
		};
		
		/**
		 * ����ɸѡ��������
		 */
		function createFilterDivHtml() {
			var html = '<div class="filterText">';
			html += '<img src="images/home.gif"/>����ɸѡ';
    		html += '</div>';
    		return html;
		};
		function bindFilterEvent() {
			$('#_tinytree_text_filter_', gdiv).keyup(function(e) {
				var value = $(this).val();
				if (e.keyCode == 13 || value == '') {
					tinytree.doFilter(value);
				}
			});	
		};
		
		function showTipMessage(parentId) {
			$('#' + tipDivIdPrefix + parentId).show();
		};
		
		function hideTipMessage(parentId) {
			$('#' + tipDivIdPrefix + parentId).hide();
		};
		
		function parseXmlNodes(parentId, xmlNode) {
			var $nodes = $('tree > node', xmlNode);
			var html = parseNodeRecursively(parentId, $nodes, false, true);
			appendHtmlTo(parentId, html);
		};
		
		/**
		 * ����JSON��ʽ������
		 */
		function parseJsonNodes(parentId, nodes) {
			var html = parseNodeRecursively(parentId, nodes, false, false);
			appendHtmlTo(parentId, html);
		};
		
		function parseNodeRecursively(parentId, nodes, hide, xmlFormat) {
			var len = nodes.length;
			if (len == 0) {
				return '';
			}
			if ($.inArray(parentId, hasLoadedChildrenCache) == -1) {
				hasLoadedChildrenCache.push(parentId + '');
			}
			var html = '<ul id="' + generateFolderId(parentId) + '"'
					+ (hide ? ' style="display:none;"' : '') + '>';
			for (var i = 0; i < len; i++) {
				var node = nodes[i];
				var nodeObj = xmlFormat ? parseNodeObjInfoFromXml(parentId, node) 
										: parseNodeObjInfoFromJson(parentId, node);
				if (nodeObj.leaf) {
					html += createLeafNodeHtml(nodeObj, (i == (len - 1)));
				} else {
					var children = xmlFormat ? $('> children > node', node)
											 : (node.children || []);
					html += createCompositeNodeHtml(nodeObj, (i == (len - 1)), children, xmlFormat);
				}
			}
			html += '</ul>';
			return html;
		};
		function parseNodeObjInfoFromXml(parentId, node) {
			return new Node($('> id', node).text(), 
							$('> name', node).text(), 
							parentId,
							$('> url', node).text(), 
							$('> checked', node).text(),
							$('> disabled', node).text(),
							$('leaf', node).text() == 'true',
							$('hide', node).text() == 'true');	
		};
		function parseNodeObjInfoFromJson(parentId, node) {
			return new Node(node.id, node.name, parentId, node.url, 
							node.checked, node.disabled, node.leaf, node.hide);	
		};
		
		function appendHtmlTo(parentId, html) {
			$('#' + generateNodeId(parentId)).append(html);
			var $folderNode = getFolderNode(parentId);
			addHitAreaEvent($folderNode);
			radioAndCheckboxEvent($folderNode);
			setHyperlinkClickEvent($folderNode);
		};
		
		function generateFolderId(parentId) {
			return "_tinytree_folder_" + parentId;
		}
		function getFolderNode(parentId) {
			return $('#' + generateFolderId(parentId));	
		}
		
		function generateNodeId(nodeId) {
			return nodeIdPrefix + nodeId;
		}
		
		function createLeafNodeHtml(node, last) {
			return '<li id="' + generateNodeId(node.nodeId) + '"' 
					+ (last ? ' class="' + classNames.last + '"' : ' class="list"') 
					+ (node.hide ? ' hide="true" style="display:none;"' : '') + '>'
					+ getRadioOrCheckboxHtml(node, true)
					+ '<span link="true" class="' + classNames.file + '">'
					+ createHyperlinkHtml(node, true) + '</span>'
					+ (node.hide ? ('<span class="' + settings.hiddenNodeClass + '"></span>') : '')
					+ '</li>';
		};
		
		function createCompositeNodeHtml(node, last, children, xmlFormat) {
			var nodeId = node.nodeId;
			var nodeName = node.nodeName;
			var staticLoad = children.length > 0;
			return '<li id="' + generateNodeId(nodeId) + '" class="' 
					+ (last ? classNames.lastExpandable : classNames.expandable) + '"'
					+ (node.hide ? ' hide="true" style="display:none;"' : '') + '>'
					+ '<div class="' + classNames.hitarea +'" nodeId="' + nodeId + '"></div>'
					+ getRadioOrCheckboxHtml(node, false)
					+ '<span link="true" class="' + classNames.closedfolder + '">'
					+ createHyperlinkHtml(node, false) 
					+ '</span>'
					+ (node.hide ? ('<span class="' + settings.hiddenNodeClass + '"></span>') : '')
					+ parseNodeRecursively(nodeId, children, true, xmlFormat)
					+ '</li>' 
					+ (staticLoad ? '' : createTipDivHtml(nodeId));
		};
		
		function addHitAreaEvent(context) {
			$('div.' + classNames.hitarea, context).click(function(e) {
				e.stopPropagation();
				var nodeId = $(this).attr('nodeId');
				openToggleLowerTree(nodeId);
			});	
		};
		
		function openToggleLowerTree(nodeId) {
			if (settings.closeSameLevel) {
				var $node = $('#' + generateNodeId(nodeId));
				justCloseNodes(getNodeIds($node.siblings()));	
			}
			if ($.inArray(nodeId, hasLoadedChildrenCache) == -1) {
				tinytree.buildLowerTree(nodeId);
			}
			nodeShowToggle(nodeId);
		}
		
		function nodeShowToggle(nodeId) {
			toggleParentNodeClass(nodeId);
			var $obj = getFolderNode(nodeId);
			$obj[ $obj.is(":hidden") ? "show" : "hide" ]();
		};
		
		function toggleParentNodeClass(nodeId) {
			changeToCollapsableClass(nodeId) || changeToExpandableClass(nodeId);
		};
		/**
		 * When open children
		 * 
		 * @param {String}
		 *            nodeId
		 * @return true | false �Ƿ�ת���ɹ���
		 */
		function changeToCollapsableClass(nodeId) {
			var $node = $('#' + generateNodeId(nodeId));
			if ($node.hasClass(classNames.lastExpandable)) {
				$('> span[link]', $node).removeClass(classNames.closedfolder).addClass(classNames.openfolder);
				$node.removeClass(classNames.lastExpandable).addClass(classNames.lastCollapsable);
				return true;
			} 
			if ($node.hasClass(classNames.expandable)) {
				$('> span[link]', $node).removeClass(classNames.closedfolder).addClass(classNames.openfolder);
				$node.removeClass(classNames.expandable).addClass(classNames.collapsable);
				return true;
			}
			return false;
		};
		/**
		 * When close children
		 * 
		 * @param {String}
		 *            nodeId
		 * @return true | false �Ƿ�ת���ɹ���
		 */
		function changeToExpandableClass(nodeId) {
			var $node = $('#' + generateNodeId(nodeId));
			if ($node.hasClass(classNames.lastCollapsable)) {
				$('> span[link]', $node).removeClass(classNames.openfolder).addClass(classNames.closedfolder);
				$node.removeClass(classNames.lastCollapsable).addClass(classNames.lastExpandable);
				return true;
			} 
			if ($node.hasClass(classNames.collapsable)) {
				$('> span[link]', $node).removeClass(classNames.openfolder).addClass(classNames.closedfolder);
				$node.removeClass(classNames.collapsable).addClass(classNames.expandable);
				return true;
			}
			return false;
		};
		
		function justOpenNodes(nodeIds) {
			$.each(nodeIds, function(i, nodeId) {
				if (nodeId == settings.root) {
					return true;
				}
				justToDoNode(nodeId, ':hidden', 'show');
			});
		};
		function justCloseNodes(nodeIds) {
			$.each(nodeIds, function(i, nodeId) {
				if (nodeId == settings.root) {
					return true;
				}
				justToDoNode(nodeId, ':visible', 'hide');
			});
		};
		function justToDoNode(nodeId, filter, operator) {
			var $obj = getFolderNode(nodeId);
			if ($obj && $obj.is(filter)) {
				toggleParentNodeClass(nodeId);
				$obj[operator]();
			}
		};
		
		function getRadioOrCheckboxHtml(node, isLeaf) {
			if (settings.radioButLeafCheckboxSupport) {
				return isLeaf 
						? createRadioOrCheckboxHtml("checkbox", node, isLeaf) 
						: createRadioOrCheckboxHtml("radio", node, isLeaf);
			}
			if (settings.radioSupport) {
				return createRadioOrCheckboxHtml("radio", node, isLeaf);
			}
			if (settings.checkboxSupport) {
				return createRadioOrCheckboxHtml("checkbox", node, isLeaf);
			}
			return '';
		}
		
		function createRadioOrCheckboxHtml(type, node, isLeaf) {
			if (settings.selectLeafOnly && !isLeaf) {
				return '';
			}
			return '<input type="' + type
					+'" name="' + settings.inputName + '"'
					+ (node.checked ? ' checked="checked"' : '')
					+ (node.disabled ? ' disabled="disabled"' : '')
					+ ' class="' + classNames.checkbox + '" value="'+ node.nodeId 
					+ '" id="checkboxId' + node.nodeId + '" treeNodeId="' 
					+ node.nodeId + '" treeNodeName="' + node.nodeName + '"/>';
		};
		
		function radioAndCheckboxEvent(context) {
			$('li :checkbox', context).click(function(e) {
				e.stopPropagation();
				var $checkbox = $(this);
				checkChildrenOrParent($checkbox);
			});
		};
		
		function checkChildrenOrParent($checkbox) {
			if (settings.alsoCheckChildren) {
				$children = $checkbox.parent().find(':checkbox');
				if ($checkbox.attr('checked')) {
					$children.attr('checked', 'checked');
				} else {
					$children.attr('checked', '');
				}
			}
			if (settings.alsoCheckParent) {
				$parent = $checkbox.parents('li').find(':checkbox:first');
				if ($checkbox.attr('checked')) {
					$parent.attr('checked', 'checked');
				}
			}
		}
		
		function createHyperlinkHtml(node, isLeaf) {
			var href = node.url || settings.nodeUrl;
			var hasUrl = href && true;
			if (hasUrl && (href.indexOf('javascript:') > -1)) { // nodeUrlΪjavascript����
				href = href + '(\'' + node.nodeId + '\',\'' + node.nodeName + '\');';
				return '<a href="#" class="' 
						+ (isLeaf ? classNames._leafHref : classNames._compositeHref) + '"'
						+ ' onclick="' + href + '"'
						+ ' nodeId="' + node.nodeId + '"'
						+ '>' + node.nodeName + '</a>';
			}
			if (hasUrl) { // ��ͨ��http href
				var existsInterrogation = href.indexOf('?') > -1;
				href = href + (existsInterrogation ? '&' : '?')
					 + 'nodeId=' + node.nodeId + '&nodeName=' + node.nodeName;
			} else {
				href = '#';
			}
			return '<a href="' + href + '" class="' 
				+ (isLeaf ? classNames._leafHref : classNames._compositeHref) + '"'
				+ (hasUrl ? ' target="' + (node.target || settings.target) + '"' : '')
				+ ' nodeId="' + node.nodeId + '"'
				+ '>' + node.nodeName + '</a>';
		};
		function setHyperlinkClickEvent(context) {
			$('li span[link] a', context).dblclick(function(e) {
				var $this = $(this);
				e.stopPropagation();
				highlight($this);
				var href = $this.attr('href');
				var isComposite = $this.hasClass(classNames._compositeHref);
				if (/.*#$/.test(href) && isComposite) {
					openToggleLowerTree($this.attr('nodeId'));
				}
				if (settings.clickNodeToCheckRadioOrCheckbox) {
					var $radioOrCheckbox = $(this).parent().parent().find(' > :radio, > :checkbox');
					if ($radioOrCheckbox.length > 0) {
						$radioOrCheckbox.attr('checked', 'checked');
						checkChildrenOrParent($radioOrCheckbox);
					}
				}
			});
		};
		
		function highlight($these) {
			unhighlight();
			$these.addClass(classNames.selected);
		};
		function unhighlight() {
			$('.' + classNames.tinytree + ' li span[link] a').removeClass(classNames.selected);	
		};
		
		function getNodeIds($nodes) {
			var nodeIds = [];
			for (var i = 0, len = $nodes.length; i < len; i++) {
				nodeIds.push($('> span[link] a', $nodes[i]).attr('nodeId'));
			}
			return nodeIds;
		};
	};

	// ----------------------------------------------------------------------------
	//-----------------------------��չ�Ĳ������----------------------------
	//-----------------------------------------------------------------------------
	/**
	 * �ò���������� 
	 * 
	 * @param {Object}
	 *            settings ������Ϣ
	 */
	$.fn.tinytree = function(settings) {
		return this.each(function() {
			$.buildTinyTree(this, (settings ? settings : {}));
		});
	};
	/**
	 * ��̬��tree, ������Ϣ�ͽڵ���Ϣ
	 */
	$.fn.addStaticNodes = function(settings, nodes) { 
		settings = $.extend(settings || {}, {autoload:false, url:false});
		return this.each(function() {
			$.buildTinyTree(this, settings);
			this.tinytree.addNodes(this.settings.root, nodes);
		});
	}; 
	/**
	 * ��̬���ӽڵ㵽ĳ�ڵ�
	 */
	//FIXME ��û��ʵ�־�̬���ӽڵ㵽ĳ�ڵ�, ��Ҫ�ǽڵ����͵�ת��
	$.fn.addNodesTo = function(parentId, nodes) { 
		return this.each(function() {
			if (this.tinytree) {
				this.tinytree.addNodes(parentId, nodes);
			}
		});
	}; 
})(jQuery);
