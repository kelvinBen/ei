package net.mast.bsp.base.id.cmd;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mast.bsp.base.id.service.IPubIdtableService;
import net.mast.bsp.organization.domain.support.StruObjectFactory;
import net.mast.bsp.permit.context.GetBspInfo;
import net.mast.waf.mvc.QueryCommandSupportWithInit;
import net.mast.waf.mvc.QueryHelper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PubIdTableQuery extends QueryCommandSupportWithInit {
	private static Log log = LogFactory.getLog(PubIdTableQuery.class);

	private IPubIdtableService pubIdtableService = null;

	public String query(HttpServletRequest arg0, HttpServletResponse arg1, QueryHelper helper, Map map)
			throws Exception {
		String topStruId = StruObjectFactory.getTopMember("00").getStruId();
		String loginStruId = GetBspInfo.getBspInfo().getLoginCorporation().getStruId();
		if (topStruId.equals(loginStruId))
			helper.setPage(getPubIdtableService().getAllOfCorporation(helper.getRowSelection(), map));
		else {
			helper.setPage(getPubIdtableService().getAllOfSubCorporation(helper.getRowSelection(), map));
		}

		return "query.query";
	}

	public IPubIdtableService getPubIdtableService() {
		return this.pubIdtableService;
	}

	public void setPubIdtableService(IPubIdtableService service) {
		this.pubIdtableService = service;
	}
}