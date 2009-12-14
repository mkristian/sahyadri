package org.sahyadrischool.books.client;

import com.google.gwt.core.client.EntryPoint;

import de.saumya.gwt.session.client.Notifications;
import de.saumya.gwt.session.client.Session;
import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.route.Screen;
import de.saumya.gwt.translation.common.client.route.ScreenController;
import de.saumya.gwt.translation.common.client.widget.ResourceActionPanel;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionPanel;
import de.saumya.gwt.translation.common.client.widget.ResourceMutator;
import de.saumya.gwt.translation.common.client.widget.ResourcePanel;
import de.saumya.gwt.translation.common.client.widget.ResourceScreen;
import de.saumya.gwt.translation.gui.client.GUIContainer;
import de.saumya.gwt.translation.gui.client.IntegerTextBoxMutator;
import de.saumya.gwt.translation.gui.client.TextAreaMutator;
import de.saumya.gwt.translation.gui.client.TextBoxMutator;

public class Books implements EntryPoint {

    public static class BookPanel extends ResourcePanel<Book> {

        protected BookPanel(final GetTextController getTextController,
                final ResourceMutator<Book> mutator) {
            super(getTextController, mutator);
            add("author", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.author);
                }

                @Override
                public void push(final Book resource) {
                    resource.author = getText();
                }
            }, false, 64);

            add("title", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.title);
                }

                @Override
                public void push(final Book resource) {
                    resource.title = getText();
                }
            }, true, 192); // required

            add("edition", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.edition);
                }

                @Override
                public void push(final Book resource) {
                    resource.edition = getText();
                }
            }, false, 64);

            add("place or publisher", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.placePublisher);
                }

                @Override
                public void push(final Book resource) {
                    resource.placePublisher = getText();
                }
            }, false, 64);

            add("status", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.status);
                }

                @Override
                public void push(final Book resource) {
                    resource.status = getText();
                }
            }, false, 16);

            add("clas no", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.clasNo);
                }

                @Override
                public void push(final Book resource) {
                    resource.clasNo = getText();
                }
            }, false, 32);

            add("year", new IntegerTextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.year);
                }

                @Override
                public void push(final Book resource) {
                    resource.year = getTextAsInt();
                }
            }, 0, 2100);

            add("pages", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.pages);
                }

                @Override
                public void push(final Book resource) {
                    resource.pages = getText();
                }
            }, false, 48);

            add("volume", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.volume);
                }

                @Override
                public void push(final Book resource) {
                    resource.volume = getText();
                }
            }, false, 16);

            add("source", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.source);
                }

                @Override
                public void push(final Book resource) {
                    resource.source = getText();
                }
            }, false, 64);

            add("cost", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.cost);
                }

                @Override
                public void push(final Book resource) {
                    resource.cost = getText();
                }
            }, false, 64);

            add("bill no", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.billNo);
                }

                @Override
                public void push(final Book resource) {
                    resource.billNo = getText();
                }
            }, false, 64);

            add("keywords", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.keywords);
                }

                @Override
                public void push(final Book resource) {
                    resource.source = getText();
                }
            }, false, 128);

            add("isbn", new TextBoxMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.isbn);
                }

                @Override
                public void push(final Book resource) {
                    resource.isbn = getText();
                }
            }, false, 32);

            add("remarks", new TextAreaMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.remarks);
                }

                @Override
                public void push(final Book resource) {
                    resource.remarks = getText();
                }
            }, 255);

        }
    }

    static class BookScreen extends ResourceScreen<Book> {

        protected BookScreen(final GetTextController getTextController,
                final BookFactory factory, final Session session,
                final ResourceMutator<Book> mutator,
                final Notifications notifications) {
            super(getTextController,
                    factory,
                    session,
                    new BookPanel(getTextController, mutator),
                    new ResourceCollectionPanel<Book>(session, factory),
                    new ResourceActionPanel<Book>(getTextController,
                            mutator,
                            session,
                            factory));
        }

        @Override
        protected void reset(final Book resource) {
            reset(resource, resource.updatedAt, resource.updatedBy);
        }

        @Override
        public Screen<?> child(final String parentKey) {
            return null;
        }

    }

    @Override
    public void onModuleLoad() {
        final GUIContainer container = new GUIContainer();

        final ScreenController screenController = container.build("en");
        final BookFactory factory = new BookFactory(container.repository,
                container.notifications,
                container.userFactory);
        screenController.addScreen(new BookScreen(container.getTextController,
                factory,
                container.session,
                new ResourceMutator<Book>(),
                container.notifications), "books");
    }
}
