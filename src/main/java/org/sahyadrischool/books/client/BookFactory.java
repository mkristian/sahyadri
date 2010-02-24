/**
 * 
 */
package org.sahyadrischool.books.client;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactoryWithID;
import de.saumya.gwt.persistence.client.ResourceNotifications;
import de.saumya.gwt.session.client.models.UserFactory;

public class BookFactory extends ResourceFactoryWithID<Book> {

    private final UserFactory userFactory;

    public BookFactory(final Repository repository,
            final ResourceNotifications notifications,
            final UserFactory userFactory) {
        super(repository, notifications);
        this.userFactory = userFactory;
    }

    @Override
    public String storageName() {
        return "book";
    }

    @Override
    public String defaultSearchParameterName() {
        return "query";
    }

    @Override
    protected Book newResource(final int id) {
        return new Book(this.repository, this, this.userFactory, id);
    }

}