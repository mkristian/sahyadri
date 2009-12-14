/**
 * 
 */
package org.sahyadrischool.books.client;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotification;
import de.saumya.gwt.session.client.model.UserFactory;

public class BookFactory extends ResourceFactory<Book> {

    private final UserFactory userFactory;

    public BookFactory(final Repository repository,
            final ResourceNotification notification,
            final UserFactory userFactory) {
        super(repository, notification);
        this.userFactory = userFactory;
    }

    @Override
    public Book newResource() {
        return new Book(this.repository,
                this,
                this.resourceChangeListener,
                this.userFactory);
    }

    @Override
    public String storageName() {
        return "book";
    }

    @Override
    public String keyName() {
        return "id";
    }

}