package org.sahyadrischool.books.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.DOM;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.Hyperlink;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.Widget;

import de.saumya.gwt.persistence.client.ResourceCollection;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;
import de.saumya.gwt.session.client.Session;
import de.saumya.gwt.session.client.Session.Action;
import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.route.HasPathFactory;
import de.saumya.gwt.translation.common.client.route.PathFactory;
import de.saumya.gwt.translation.common.client.widget.DefaultResourceActionPanel;
import de.saumya.gwt.translation.common.client.widget.HyperlinkFactory;
import de.saumya.gwt.translation.common.client.widget.LoadingNotice;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionNavigationWithCSVExport;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionPanel;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionResetable;
import de.saumya.gwt.translation.common.client.widget.ResourceFields;
import de.saumya.gwt.translation.common.client.widget.ResourceHeaderPanel;
import de.saumya.gwt.translation.common.client.widget.ResourcePanel;
import de.saumya.gwt.translation.common.client.widget.ResourceScreen;
import de.saumya.gwt.translation.gui.client.GUIContainer;
import de.saumya.gwt.translation.gui.client.bindings.IntegerTextBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.TextAreaBinding;
import de.saumya.gwt.translation.gui.client.bindings.TextBoxBinding;

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

    private static class BookListing extends Grid implements HasPathFactory,
            ResourceCollectionResetable<Book> {

        private PathFactory                   pathFactory;
        protected final Session               session;

        protected final ResourceFactory<Book> factory;

        private static Element append(final Element tr, final String text) {
            final Element th = DOM.createElement("th");
            th.setInnerText(text);
            DOM.appendChild(tr, th);
            return th;
        }

        BookListing(final Session session, final ResourceFactory<Book> factory) {
            super(11, 16);
            setStyleName("books");
            setCellSpacing(0);
            this.factory = factory;
            this.session = session;
            final Element thead = DOM.createElement("thead");
            DOM.insertChild(getElement(), thead, 1);
            final Element tr = DOM.createElement("tr");
            DOM.appendChild(thead, tr);
            append(tr, "id");
            append(tr, "title");
            append(tr, "author");
            append(tr, "billNo");
            append(tr, "clasNo");
            append(tr, "cost");
            append(tr, "edition");
            append(tr, "isbn");
            append(tr, "keywords");
            append(tr, "pages");
            append(tr, "placePublisher");
            append(tr, "source");
            append(tr, "status");
            append(tr, "volume");
            append(tr, "remarks");
            final Element last = append(tr, "\u00a0");
            DOM.setElementProperty(last, "width", "15");
        }

        @Override
        public PathFactory getPathFactory() {
            return this.pathFactory;
        }

        @Override
        public void setPathFactory(final PathFactory pathFactory) {
            this.pathFactory = pathFactory;
        }

        enum Display {
            EDIT, SHOW, DISPLAY
        }

        Display display() {
            if (this.session.isAllowed(Action.UPDATE,
                                       this.factory.storagePluralName())) {
                return Display.EDIT;
            }
            else if (this.session.isAllowed(Action.SHOW,
                                            this.factory.storagePluralName())) {
                return Display.SHOW;
            }
            else {
                return Display.DISPLAY;
            }
        }

        Widget createHyperlink(final Display display, final String text,
                final Book resource) {
            switch (display) {
            case EDIT:
                return new Hyperlink(text,
                        this.pathFactory.editPath(resource.key()));
            case SHOW:
                return new Hyperlink(text,
                        this.pathFactory.showPath(resource.key()));
            case DISPLAY:
                return new Label(text);
            default:
                throw new RuntimeException("should never reach here");
            }

        }

        @Override
        public void setText(final int row, final int col, final String text) {
            super.setText(row, col, text == null ? "\u00a0" : text);
        }

        @Override
        public void reset(final ResourceCollection<Book> resources) {
            setVisible(resources.size() != 0);
            resizeRows(resources.size());

            int rowCount = 0;
            // calculate the display permission only once !!!
            final Display display = display();
            for (final Book book : resources) {
                getRowFormatter().setStyleName(rowCount,
                                               rowCount % 2 == 0
                                                       ? "books-even"
                                                       : "books-odd");
                setText(rowCount, 0, book.key());
                setWidget(rowCount, 1, createHyperlink(display,
                                                       book.title,
                                                       book));
                setText(rowCount, 2, book.author);
                setText(rowCount, 3, book.billNo);
                setText(rowCount, 4, book.clasNo);
                setText(rowCount, 5, book.cost);
                setText(rowCount, 6, book.edition);
                setText(rowCount, 7, book.isbn);
                setText(rowCount, 8, book.keywords);
                setText(rowCount, 9, book.pages);
                setText(rowCount, 10, book.placePublisher);
                setText(rowCount, 11, book.source);
                setText(rowCount, 12, book.status);
                setText(rowCount, 13, book.volume);
                setText(rowCount, 14, book.remarks);
                setText(rowCount, 15, null);
                rowCount++;
            }
        }
    }

    private static class BookScreen extends ResourceScreen<Book> {

        protected BookScreen(final LoadingNotice loadingNotice,
                final GetTextController getTextController,
                final BookFactory factory, final Session session,
                final ResourceBindings<Book> bindings,
                final ResourceNotifications notifications,
                final HyperlinkFactory hyperlinkFactory) {
            super(loadingNotice,
                    factory,
                    session,
                    new ResourcePanel<Book>(new BookHeader(getTextController),
                            new BookFields(getTextController, bindings)),
                    new ResourceCollectionPanel<Book>(loadingNotice,
                            new ResourceCollectionNavigationWithCSVExport<Book>(loadingNotice,
                                    factory,
                                    getTextController),
                            new BookListing(session, factory)),
                    new DefaultResourceActionPanel<Book>(getTextController,
                            bindings,
                            session,
                            factory,
                            notifications,
                            hyperlinkFactory),
                    notifications,
                    hyperlinkFactory);
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
                                                     container.notifications,
                                                     container.hyperlinkFactory),
                                             "books");
    }
}
