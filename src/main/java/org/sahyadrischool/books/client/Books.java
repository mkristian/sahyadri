package org.sahyadrischool.books.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.ui.RootPanel;

import de.saumya.gwt.persistence.client.ResourceNotifications;
import de.saumya.gwt.session.client.Session;
import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.widget.DefaultResourceActionPanel;
import de.saumya.gwt.translation.common.client.widget.LoadingNotice;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionListing;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionNavigationWithCSVExport;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionPanel;
import de.saumya.gwt.translation.common.client.widget.ResourceFields;
import de.saumya.gwt.translation.common.client.widget.ResourceHeaderPanel;
import de.saumya.gwt.translation.common.client.widget.ResourcePanel;
import de.saumya.gwt.translation.common.client.widget.ResourceScreen;
import de.saumya.gwt.translation.gui.client.GUIContainer;
import de.saumya.gwt.translation.gui.client.IntegerTextBoxBinding;
import de.saumya.gwt.translation.gui.client.TextAreaBinding;
import de.saumya.gwt.translation.gui.client.TextBoxBinding;

public class Books implements EntryPoint {

    private static class BookFields extends ResourceFields<Book> {

        protected BookFields(final GetTextController getTextController,
                final ResourceBindings<Book> bindings) {
            super(getTextController, bindings);
            add("author", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.author);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.author = getText();
                }
            }, false, 64);

            add("title", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.title);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.title = getText();
                }
            }, true, 192); // required

            add("edition", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.edition);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.edition = getText();
                }
            }, false, 64);

            add("place or publisher", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.placePublisher);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.placePublisher = getText();
                }
            }, false, 64);

            add("status", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.status);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.status = getText();
                }
            }, false, 16);

            add("clas no", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.clasNo);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.clasNo = getText();
                }
            }, false, 32);

            add("year", new IntegerTextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.year);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.year = getTextAsInt();
                }
            }, 0, 2100);

            add("pages", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.pages);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.pages = getText();
                }
            }, false, 48);

            add("volume", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.volume);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.volume = getText();
                }
            }, false, 16);

            add("source", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.source);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.source = getText();
                }
            }, false, 64);

            add("cost", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.cost);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.cost = getText();
                }
            }, false, 64);

            add("bill no", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.billNo);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.billNo = getText();
                }
            }, false, 64);

            add("keywords", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.keywords);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.source = getText();
                }
            }, false, 128);

            add("isbn", new TextBoxBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.isbn);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.isbn = getText();
                }
            }, false, 32);

            add("remarks", new TextAreaBinding<Book>() {

                @Override
                public void pullFrom(final Book resource) {
                    setText(resource.remarks);
                }

                @Override
                public void pushInto(final Book resource) {
                    resource.remarks = getText();
                }
            }, 255);

        }
    }

    private static class BookHeader extends ResourceHeaderPanel<Book> {

        public BookHeader(final GetTextController getTextController) {
            super(getTextController);
        }

        @Override
        public void reset(final Book resource) {
            reset(resource, resource.updatedAt, resource.updatedBy);
        }

    }

    private static class BookScreen extends ResourceScreen<Book> {

        protected BookScreen(final LoadingNotice loadingNotice,
                final GetTextController getTextController,
                final BookFactory factory, final Session session,
                final ResourceBindings<Book> bindings,
                final ResourceNotifications notifications) {
            super(loadingNotice,
                    factory,
                    session,
                    new ResourcePanel<Book>(new BookHeader(getTextController),
                            new BookFields(getTextController, bindings)),
                    new ResourceCollectionPanel<Book>(loadingNotice,
                            new ResourceCollectionNavigationWithCSVExport<Book>(loadingNotice,
                                    factory,
                                    getTextController),
                            new ResourceCollectionListing<Book>(session,
                                    factory,
                                    getTextController)),
                    new DefaultResourceActionPanel<Book>(getTextController,
                            bindings,
                            session,
                            factory,
                            notifications),
                    notifications);
        }
    }

    @Override
    public void onModuleLoad() {

        final GUIContainer container = new GUIContainer(RootPanel.get());

        final BookFactory factory = new BookFactory(container.repository,
                container.notifications,
                container.userFactory);
        container.screenController.addScreen(new BookScreen(container.loadingNotice,
                                                     container.getTextController,
                                                     factory,
                                                     container.session,
                                                     new ResourceBindings<Book>(),
                                                     container.notifications),
                                             "books");
    }
}
