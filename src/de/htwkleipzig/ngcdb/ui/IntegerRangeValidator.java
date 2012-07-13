package de.htwkleipzig.ngcdb.ui;

import com.vaadin.data.Validator;

@SuppressWarnings("serial")
public class IntegerRangeValidator implements Validator{

    private final int minValue;
    private final int maxValue;
    private final String message;

    /**
     * Constructs a new instance.
     *
     * @param minValue The minValue for this instance.
     * @param maxValue The maxValue for this instance.
     * @param message The message for this instance.
     */
    public IntegerRangeValidator(int minValue, int maxValue, String message) {
        this.minValue = minValue;
        this.maxValue = maxValue;
        this.message = message;
    }

    /**
     * Constructs a new instance.
     *
     * @param minValue The minValue for this instance.
     * @param maxValue The maxValue for this instance.
     */
    public IntegerRangeValidator(int minValue, int maxValue) {
        this(minValue,maxValue,"Value has to be an integer between "+minValue+" and "+maxValue);
    }

    public void validate(Object value) throws InvalidValueException {
        if (! isValid(value)) 
            throw new InvalidValueException(message);
    }

    public boolean isValid(Object value) {
        try {
            int intValue = Integer.parseInt(value.toString());
            if (intValue >= minValue && intValue <= maxValue)
                return true;
        } catch (NumberFormatException e) { /* do nothing */ }
        return false;
    }
}
