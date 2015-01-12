package net.mast.waf.data;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public abstract class LazyInitList implements List {
	private List nest = null;

	protected abstract List init();

	private void checkInit() {
		if (this.nest == null)
			this.nest = init();
	}

	public boolean add(Object o) {
		checkInit();
		return this.nest.add(o);
	}

	public void add(int index, Object element) {
		checkInit();
		this.nest.add(index, element);
	}

	public boolean addAll(Collection c) {
		checkInit();
		return this.nest.addAll(c);
	}

	public boolean addAll(int index, Collection c) {
		checkInit();
		return this.nest.addAll(index, c);
	}

	public void clear() {
		if (this.nest != null) {
			this.nest.clear();
			this.nest = null;
		}
	}

	public boolean contains(Object o) {
		checkInit();
		return this.nest.contains(o);
	}

	public boolean containsAll(Collection c) {
		checkInit();
		return this.nest.containsAll(c);
	}

	public Object get(int index) {
		checkInit();
		return this.nest.get(index);
	}

	public int indexOf(Object o) {
		checkInit();
		return this.nest.indexOf(o);
	}

	public boolean isEmpty() {
		checkInit();
		return this.nest.isEmpty();
	}

	public Iterator iterator() {
		checkInit();
		return this.nest.iterator();
	}

	public int lastIndexOf(Object o) {
		checkInit();
		return this.nest.lastIndexOf(o);
	}

	public ListIterator listIterator() {
		checkInit();
		return this.nest.listIterator();
	}

	public ListIterator listIterator(int index) {
		checkInit();
		return this.nest.listIterator(index);
	}

	public Object remove(int index) {
		checkInit();
		return this.nest.remove(index);
	}

	public boolean remove(Object o) {
		checkInit();
		return this.nest.remove(o);
	}

	public boolean removeAll(Collection c) {
		checkInit();
		return this.nest.removeAll(c);
	}

	public boolean retainAll(Collection c) {
		checkInit();
		return this.nest.retainAll(c);
	}

	public Object set(int index, Object element) {
		checkInit();
		return this.nest.set(index, element);
	}

	public int size() {
		checkInit();
		return this.nest.size();
	}

	public List subList(int fromIndex, int toIndex) {
		checkInit();
		return this.nest.subList(fromIndex, toIndex);
	}

	public Object[] toArray() {
		checkInit();
		return this.nest.toArray();
	}

	public Object[] toArray(Object[] a) {
		checkInit();
		return this.nest.toArray(a);
	}
}