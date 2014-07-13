package net.mast.waf;

import java.util.Iterator;
import java.util.Vector;

import net.mast.util.ExtendedProperties;
import net.mast.waf.ext.service.resources.ResourcesService;

public class RF extends ComponentFactory {
	public static Iterator getKeys() {
		return getResourcesService().getKeys();
	}

	public static Iterator getKeys(String prefix) {
		return getResourcesService().getKeys(prefix);
	}

	public static boolean getBoolean(String name) {
		return getResourcesService().getBoolean(name);
	}

	public static boolean getBoolean(String name, boolean def) {
		return getResourcesService().getBoolean(name, def);
	}

	public static double getDouble(String name) {
		return getResourcesService().getDouble(name);
	}

	public static double getDouble(String name, double def) {
		return getResourcesService().getDouble(name, def);
	}

	public static float getFloat(String name) {
		return getResourcesService().getFloat(name);
	}

	public static float getFloat(String name, float def) {
		return getResourcesService().getFloat(name, def);
	}

	public static int getInt(String name) {
		return getResourcesService().getInt(name);
	}

	public static int getInt(String name, int def) {
		return getResourcesService().getInt(name, def);
	}

	public static long getLong(String name) {
		return getResourcesService().getLong(name);
	}

	public static long getLong(String name, long def) {
		return getResourcesService().getLong(name, def);
	}

	public static String getString(String name) {
		return getResourcesService().getString(name);
	}

	public static String getString(String name, String def) {
		return getResourcesService().getString(name, def);
	}

	public static String get(String name) {
		return getResourcesService().getString(name);
	}

	public static String get(String name, String def) {
		return getResourcesService().getString(name, def);
	}

	public static String[] getStringArray(String name) {
		return getResourcesService().getStringArray(name);
	}

	public static Vector getVector(String name) {
		return getResourcesService().getVector(name);
	}

	public static Vector getVector(String name, Vector def) {
		return getResourcesService().getVector(name, def);
	}

	public static ExtendedProperties getExtendedProperties(String prefix) {
		return getResourcesService().getExtendedProperties(prefix);
	}

	public static ResourcesService getResourcesService() {
		return ((ResourcesService) ComponentFactory.getBean("ResourcesService"));
	}
}