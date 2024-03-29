package com.example.buoi4.hanlder;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

public class myFirstCustomTag implements Tag {
    private Tag parent;
    private PageContext pageContext;

    public String name;
    @Override
    public void setPageContext(PageContext pageContext) {
        this.pageContext = pageContext;
    }

    @Override
    public void setParent(Tag tag) {
        this.parent = parent;
    }

    @Override
    public Tag getParent() {
        return this.parent;
    }

    @Override
    public int doStartTag() throws JspException {
        JspWriter writer = pageContext.getOut();

        try {
            writer.println("<h1>Welcom "+name+" to T2108E</h1>");
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }

    @Override
    public void release() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
