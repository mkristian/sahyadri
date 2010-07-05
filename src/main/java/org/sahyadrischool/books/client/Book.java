/**
 * 
 */
package org.sahyadrischool.books.client;

import java.sql.Timestamp;

import com.google.gwt.xml.client.Element;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.session.client.models.User;
import de.saumya.gwt.session.client.models.UserFactory;

public class Book extends Resource<Book> {

    private final UserFactory userFactory;

    protected Book(final Repository repository, final BookFactory factory,
            final UserFactory userFactory, final int id) {
        super(repository, factory, id);
        this.userFactory = userFactory;
    }

    public String    author;
    public String    title;
    public String    edition;
    public String    placePublisher;
    public String    status;
    public String    clasNo;
    public int       year;
    public String    pages;
    public String    volume;
    public String    source;
    public String    cost;
    public String    billNo;
    public String    isbn;
    public String    keywords;
    public String    remarks;

    public Timestamp updatedAt;
    public User      updatedBy;

    @Override
    protected void appendXml(final StringBuilder buf) {
        appendXml(buf, "author", this.author);
        appendXml(buf, "title", this.title);
        appendXml(buf, "edition", this.edition);
        appendXml(buf, "place_publisher", this.placePublisher);
        appendXml(buf, "status", this.status);
        appendXml(buf, "clas_no", this.clasNo);
        appendXml(buf, "year", this.year);
        appendXml(buf, "pages", this.pages);
        appendXml(buf, "volume", this.volume);
        appendXml(buf, "source", this.source);
        appendXml(buf, "cost", this.cost);
        appendXml(buf, "bill_no", this.billNo);
        appendXml(buf, "isbn", this.isbn);
        appendXml(buf, "keywords", this.keywords);
        appendXml(buf, "remarks", this.remarks);

        appendXml(buf, "updated_at", this.updatedAt);
        appendXml(buf, "updated_by", this.updatedBy);
    }

    @Override
    protected void fromElement(final Element root) {
        this.author = getString(root, "author");
        this.title = getString(root, "title");
        this.edition = getString(root, "edition");
        this.placePublisher = getString(root, "place_publisher");
        this.status = getString(root, "status");
        this.clasNo = getString(root, "clas_no");
        this.year = getInt(root, "year");
        this.pages = getString(root, "pages");
        this.volume = getString(root, "volume");
        this.source = getString(root, "source");
        this.cost = getString(root, "cost");
        this.billNo = getString(root, "bill_no");
        this.isbn = getString(root, "isbn");
        this.keywords = getString(root, "keywords");
        this.remarks = getString(root, "remarks");

        this.updatedAt = getTimestamp(root, "updated_at");
        this.updatedBy = this.userFactory.getChildResource(root, "updated_by");
    }

    @Override
    public void toString(final String indent, final StringBuilder buf) {
        toString(indent, buf, "author", this.author);
        toString(indent, buf, "title", this.title);
        toString(indent, buf, "edition", this.edition);
        toString(indent, buf, "place_publisher", this.placePublisher);
        toString(indent, buf, "status", this.status);
        toString(indent, buf, "clas_no", this.clasNo);
        toString(indent, buf, "year", this.year);
        toString(indent, buf, "pages", this.pages);
        toString(indent, buf, "volume", this.volume);
        toString(indent, buf, "source", this.source);
        toString(indent, buf, "cost", this.cost);
        toString(indent, buf, "bill", this.billNo);
        toString(indent, buf, "isbn", this.isbn);
        toString(indent, buf, "keywords", this.keywords);
        toString(indent, buf, "remarks", this.remarks);
        toString(indent, buf, "updated_at", this.updatedAt);
        toString(indent, buf, "updated_by", this.updatedBy);
    }

    @Override
    public String display() {
        if (this.author == null) {
            return this.title == null ? "" : this.title;
        }
        else {
            return new StringBuffer(this.title).append(": ")
                    .append(this.author)
                    .toString();
        }
    }
}