package net.mast.web.taglib.html;

import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import net.mast.beanutil.IPropertyUtil;
import net.mast.beanutil.PropertyUtilFactory;
import net.mast.web.taglib.util.Constants;
import net.mast.web.taglib.util.LocaleUtils;
import net.mast.web.taglib.util.MessageResources;
import net.mast.web.taglib.util.RequestUtils;
import net.mast.web.taglib.util.ResponseUtils;

public class PureLabelTag extends BaseFieldTag
{
  private String collection = null;
  private String labelProperty = null;
  private String labelKey = null;
  private String visible = "true";

  public int doStartTag()
    throws JspException
  {
    String results = "";
    if (getValue() != null) {
      results = ResponseUtils.filter(getValue());
    }
    else {
      Object value = getValueByProperty();
      if (value == null)
        results = "";
      else
        results = ResponseUtils.filter(value.toString());
    }

    StringBuffer hiddenHtml = new StringBuffer("<span>");


    ResponseUtils.write(this.pageContext, hiddenHtml.toString());

    String nameV = "";
    if (getCollection() != null) {
      Iterator collIterator = RequestUtils.getIterator(this.pageContext, 
        this.collection, null);
      if (collIterator == null)
        throw new JspException(getMessages().getMessage
          (LocaleUtils.getCurrentLocale((HttpServletRequest)this.pageContext.getRequest()), 
          "optionsTag.iterator", this.collection.toString()));

      Object bean = null;
      Object value = null;
      Object label = null;
      while (collIterator.hasNext()) {
        bean = collIterator.next();
        if (getLabelKey().startsWith(Constants.SYMBOL))
          value = PropertyUtilFactory.getInstance("ognl").getObjectByKey
            (bean, getLabelKey().substring(1));
        else
          value = PropertyUtilFactory.getInstance("prop").getObjectByKey
            (bean, getLabelKey());

        if (value == null)
          value = "";

        if (getLabelProperty() != null) {
          if (getLabelProperty().startsWith(Constants.SYMBOL))
            label = PropertyUtilFactory.getInstance("ognl").getObjectByKey
              (bean, 
              getLabelProperty().substring(1));
          else
            label = PropertyUtilFactory.getInstance("prop").getObjectByKey
              (bean, this.labelProperty);

        }
        else
          label = value;

        if (label == null)
          label = "";

        String stringValue = value.toString();
        if (stringValue.equalsIgnoreCase(results)) {
          results = label.toString();
          break;
        }
      }

    }

    if ((getType() != null) && (getType().equals("text"))) {
      setName(getName() + "_TEXT");
      setValue(results);
      super.doStartTag();
    }
    else
    {
      ResponseUtils.write(this.pageContext, results);
    }
    ResponseUtils.write(this.pageContext, "</span>");
    return 2;
  }

  public int doEndTag()
    throws JspException
  {
    int end = super.doEndTag();
    setValue(null);
    setType(null);
    setCollection(null);
    return end;
  }

  public void release()
  {
    this.collection = null;
    this.labelProperty = null;

    super.release();
  }

  public String getCollection()
  {
    return this.collection;
  }

  public void setCollection(String string)
  {
    this.collection = string;
  }

  public String getLabelProperty()
  {
    return this.labelProperty;
  }

  public void setLabelProperty(String string)
  {
    this.labelProperty = string;
  }

  public String getLabelKey()
  {
    return this.labelKey;
  }

  public void setLabelKey(String string)
  {
    this.labelKey = string;
  }

  public String getVisible() {
    return this.visible;
  }

  public void setVisible(String visible) {
    this.visible = visible;
  }
}