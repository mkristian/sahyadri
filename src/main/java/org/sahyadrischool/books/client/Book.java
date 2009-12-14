/**
 * 
 */
package org.sahyadrischool.books.client;

import java.sql.Timestamp;

import com.google.gwt.xml.client.Element;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceChangeListener;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceWithID;
import de.saumya.gwt.session.client.model.User;
import de.saumya.gwt.session.client.model.UserFactory;

public class Book extends ResourceWithID<Book> {

    private final UserFactory userFactory;

    protected Book(final Repository repository,
            final ResourceFactory<Book> factory,
            final ResourceChangeListener<Book> listener,
            final UserFactory userFactory) {
        super(repository, factory, listener);
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
    protected void appendXml(final StringBuffer buf) {
        super.appendXml(buf);
        append(buf, "author", this.author);
        append(buf, "title", this.title);
        append(buf, "edition", this.edition);
        append(buf, "place_publisher", this.placePublisher);
        append(buf, "status", this.status);
        append(buf, "clas_no", this.clasNo);
        append(buf, "year", this.year);
        append(buf, "pages", this.pages);
        append(buf, "volume", this.volume);
        append(buf, "source", this.source);
        append(buf, "cost", this.cost);
        append(buf, "bill_no", this.billNo);
        append(buf, "isbn", this.isbn);
        append(buf, "keywords", this.keywords);
        append(buf, "remarks", this.remarks);

        append(buf, "updated_at", this.updatedAt);
        append(buf, "updated_by", this.updatedBy);
    }

    @Override
    protected void fromXml(final Element root) {
        super.fromXml(root);
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
    public void toString(final StringBuffer buf) {
        super.toString(buf);
        buf.append(":author => ").append(this.author);
        buf.append(", :title => ").append(this.title);
        buf.append(", :edition => ").append(this.edition);
        buf.append(", :place_publisher => ").append(this.placePublisher);
        buf.append(", :status => ").append(this.status);
        buf.append(", :clas_no => ").append(this.clasNo);
        buf.append(", :year => ").append(this.year);
        buf.append(", :pages => ").append(this.pages);
        buf.append(", :volume => ").append(this.volume);
        buf.append(", :source => ").append(this.source);
        buf.append(", :cost => ").append(this.cost);
        buf.append(", :bill_no => ").append(this.billNo);
        buf.append(", :isbn => ").append(this.isbn);
        buf.append(", :keywords => ").append(this.keywords);
        buf.append(", :remarks => ").append(this.remarks);
        buf.append(", :updated_at => ").append(this.updatedAt);
        if (this.updatedBy != null) {
            buf.append(", :updated_by => ");
            this.updatedBy.toString(buf);
        }
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