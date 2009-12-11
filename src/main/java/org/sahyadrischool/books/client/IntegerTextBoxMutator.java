package org.sahyadrischool.books.client;

import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.translation.common.client.widget.ResourceMutator;
import de.saumya.gwt.translation.gui.client.TextBoxMutator;

public abstract class IntegerTextBoxMutator<T extends Resource<T>> extends
        TextBoxMutator<T> {

    public IntegerTextBoxMutator(final ResourceMutator<T> resourceMutator) {
        super(resourceMutator);
    }

    public int getTextAsInt() {
        return Integer.parseInt(getText());
    }

    public boolean isNumber() {
        try {
            getTextAsInt();
            return true;
        }
        catch (final RuntimeException e) {
            return false;
        }
    }

    public void setText(final int n) {
        setText("" + n);
    }
}
