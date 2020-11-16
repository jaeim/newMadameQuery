package model.service;

public class ConditionMismatchException extends Exception{
	private static final long serialVersionUID = 1L;

	public ConditionMismatchException() {
		super();
	}
	
	public ConditionMismatchException(String message) {
		super(message);
	}

	
}
