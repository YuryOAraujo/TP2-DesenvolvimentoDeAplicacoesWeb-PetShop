package yoa.daw.utilities;

public enum StatusEnum {
	SCHEDULED("Agendado"),
	COMPLETED("Finalizado"),
	CANCELED("Cancelado");
	
	private final String status;

	public String getStatus() {
		return status;
	}

	private StatusEnum(String status) {
		this.status = status;
	}
}
