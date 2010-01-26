/**
 * 
 */
package org.sahyadrischool.books.client;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;
import de.saumya.gwt.session.client.model.UserFactory;

public class BookFactory extends ResourceFactory<Book> {

    private final UserFactory userFactory;

    public BookFactory(final Repository repository,
            final ResourceNotifications notifications,
            final UserFactory userFactory) {
        super(repository, notifications);
        this.userFactory = userFactory;
    }

    @Override
    public Book newResource() {
        return new Book(this.repository, this, this.userFactory);
    }

    @Override
    public String storageName() {
        return "book";
    }

    @Override
    public String keyName() {
        return "id";
    }

    @Override
    public String defaultSearchParameterName() {
        return "query";
    }

}