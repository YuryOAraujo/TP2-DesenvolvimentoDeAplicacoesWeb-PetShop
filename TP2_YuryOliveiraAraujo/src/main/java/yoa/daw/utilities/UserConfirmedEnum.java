package yoa.daw.utilities;

public enum UserConfirmedEnum {
	NOT_CONFIRMED("Não autorizado"),
	CONFIRMED("Autorizado");
	
	private final String size;

	private UserConfirmedEnum(String size) {
		this.size = size;
	}

	public String getSize() {
		return size;
	}
}
