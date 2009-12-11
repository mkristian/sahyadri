package org.sahyadrischool.books.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.dom.client.KeyCodes;
import com.google.gwt.event.dom.client.KeyPressEvent;
import com.google.gwt.event.dom.client.KeyPressHandler;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.user.client.ui.ComplexPanel;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.TextBoxBase;

import de.saumya.gwt.session.client.Session;
import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.route.Screen;
import de.saumya.gwt.translation.common.client.route.ScreenController;
import de.saumya.gwt.translation.common.client.widget.ResourceActionPanel;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionPanel;
import de.saumya.gwt.translation.common.client.widget.ResourceMutator;
import de.saumya.gwt.translation.common.client.widget.ResourcePanel;
import de.saumya.gwt.translation.common.client.widget.ResourceScreen;
import de.saumya.gwt.translation.common.client.widget.TranslatableLabel;
import de.saumya.gwt.translation.gui.client.GUIContainer;
import de.saumya.gwt.translation.gui.client.TextBoxMutator;

public class Books implements EntryPoint {

    static class BookPanel extends ResourcePanel<Book> {

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

            add("remarks", new TextAreaMutator<Book>(mutator) {

                @Override
                public void pull(final Book resource) {
                    setText(resource.remarks);
                }

                @Override
                public void push(final Book resource) {
                    resource.remarks = getText();
                }
            });

        }

        void add(final String label, final IntegerTextBoxMutator<Book> textBox,
                final int min, final int max) {
            final ComplexPanel panel = new FlowPanel();
            final Label message = new TranslatableLabel(this.getTextController);
            message.setStyleName("is-ok");
            textBox.addKeyPressHandler(new KeyPressHandler() {

                @Override
                public void onKeyPress(final KeyPressEvent event) {
                    if ((event.getCharCode() < '0' || event.getCharCode() > '9')
                            && event.getCharCode() > ' ') {
                        event.stopPropagation();
                        event.preventDefault();
                        message.setText("is a number");
                        message.setStyleName("is-ok");
                        panel.setStyleName("");
                    }
                }
            });
            textBox.addKeyUpHandler(new KeyUpHandler() {

                @Override
                public void onKeyUp(final KeyUpEvent event) {
                    if (!textBox.isNumber()) {
                        message.setText("is a number");
                        message.setStyleName("is-error");
                        panel.setStyleName("has-errors");
                    }
                    else if (textBox.getTextAsInt() > max) {
                        message.setText("exceeded maximum " + max);
                        message.setStyleName("is-error");
                        panel.setStyleName("has-errors");
                    }
                    else if (textBox.getTextAsInt() < min) {
                        message.setText("under minimum " + max);
                        message.setStyleName("is-error");
                        panel.setStyleName("has-errors");
                    }
                    else {
                        message.setText("");
                        panel.setStyleName("");
                    }
                }
            });
            panel.add(message);
            panel.add(new TranslatableLabel(label, this.getTextController));
            panel.add(textBox);
            add(panel);
        }

        void add(final String label, final TextBoxBase textBox) {
            add(label, textBox, false, 20);
        }

        void add(final String label, final TextBoxBase textBox,
                final boolean required, final int max) {
            final ComplexPanel panel = new FlowPanel();
            final Label message;
            if (required) {
                message = new TranslatableLabel("required",
                        this.getTextController);
            }
            else {
                message = new TranslatableLabel("", this.getTextController);
            }
            message.setStyleName("is-ok");
            panel.add(message);
            textBox.addKeyPressHandler(new KeyPressHandler() {

                boolean isPrintable(final int keyCode) {
                    switch (keyCode) {
                    case KeyCodes.KEY_BACKSPACE:
                    case KeyCodes.KEY_DELETE:
                    case KeyCodes.KEY_END:
                    case KeyCodes.KEY_ENTER:
                    case KeyCodes.KEY_ESCAPE:
                    case KeyCodes.KEY_HOME:
                    case KeyCodes.KEY_PAGEDOWN:
                    case KeyCodes.KEY_PAGEUP:
                    case KeyCodes.KEY_TAB:
                    case KeyCodes.KEY_DOWN:
                    case KeyCodes.KEY_RIGHT:
                    case KeyCodes.KEY_UP:
                    case KeyCodes.KEY_LEFT:
                        return false;
                    default:
                        return true;
                    }
                }

                @Override
                public void onKeyPress(final KeyPressEvent event) {
                    if (textBox.getText().length() >= max
                            && isPrintable(event.getNativeEvent().getKeyCode())
                            && event.getCharCode() > ' ') {
                        event.stopPropagation();
                        event.preventDefault();
                        panel.setStyleName("has-errors");
                    }
                }
            });
            textBox.addKeyUpHandler(new KeyUpHandler() {

                @Override
                public void onKeyUp(final KeyUpEvent event) {
                    final int len = ((TextBoxBase) event.getSource()).getText()
                            .length();
                    if ((!required || len > 0) && len < max) {
                        if (required) {
                            message.setText("required");
                        }
                        else {
                            message.setText("");
                        }
                        message.setStyleName("is-ok");
                        panel.setStyleName("");
                    }
                    else {
                        if (len >= max) {
                            message.setText("maximum length reached");
                            if (len == max) {
                                message.setStyleName("is-ok");
                                panel.setStyleName("");
                            }
                            else {
                                message.setStyleName("is-error");
                                panel.setStyleName("has-errors");
                            }
                        }
                        else {
                            message.setStyleName("is-error");
                            panel.setStyleName("has-errors");
                            message.setText("required");
                        }
                    }
                }
            });
            // }
            // else {
            // final Label l = new Label("\u00a0");
            // l.setStyleName("is-ok");
            // panel.add(l);
            // }
            panel.add(new TranslatableLabel(label, this.getTextController));
            panel.add(textBox);
            add(panel);
        }
    }

    static class BookScreen extends ResourceScreen<Book> {

        protected BookScreen(final GetTextController getTextController,
                final BookFactory factory, final Session session,
                final ResourceMutator<Book> mutator) {
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
                container.userFactory);
        screenController.addScreen(new BookScreen(container.getTextController,
                factory,
                container.session,
                new ResourceMutator<Book>()), "books");
    }
}
