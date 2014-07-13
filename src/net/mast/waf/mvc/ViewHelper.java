package net.mast.waf.mvc;

public class ViewHelper {
	private Object view;
	private String[] listnames;
	private String primaryKey;
	private boolean isSearch = true;

	public Object getView() {
		return this.view;
	}

	public void setView(Object object) {
		this.view = object;
	}

	public String[] getListnames() {
		return this.listnames;
	}

	public void setListnames(String[] listnames) {
		this.listnames = listnames;
	}

	public String getPrimaryKey() {
		return this.primaryKey;
	}

	public void setPrimaryKey(String primaryKey) {
		this.primaryKey = primaryKey;
	}

	public boolean isSearch() {
		return this.isSearch;
	}

	public void setSearch(boolean isSearch) {
		this.isSearch = isSearch;
	}
}