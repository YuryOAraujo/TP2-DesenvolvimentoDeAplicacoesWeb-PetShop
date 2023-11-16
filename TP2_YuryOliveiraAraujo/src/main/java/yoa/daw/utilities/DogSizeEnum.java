package yoa.daw.utilities;

public enum DogSizeEnum {
	SMALL("Pequeno"),
	MEDIUM("Médio"),
	LARGE("Grande");
	
	private final String size;

	private DogSizeEnum(String size) {
		this.size = size;
	}

	public String getSize() {
		return size;
	}
}
