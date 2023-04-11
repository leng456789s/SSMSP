package hb.rj.dao.entity;

public class Condition {
    private String conIndex;//查询条件的序号
    private String text_search;//条件的值

    public Condition(){}

    public String getConIndex() {
        return conIndex;
    }

    public void setConIndex(String conIndex) {
        this.conIndex = conIndex;
    }

    public String getText_search() {
        return text_search;
    }

    public void setText_search(String text_search) {
        this.text_search = text_search;
    }
}
