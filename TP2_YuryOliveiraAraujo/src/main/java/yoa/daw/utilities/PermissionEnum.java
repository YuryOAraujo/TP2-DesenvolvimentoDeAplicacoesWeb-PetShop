package yoa.daw.utilities;

public enum PermissionEnum {
	USER("user"),
	ADMIN("admin");
	
	private final String permission;

	private PermissionEnum(String permission) {
		this.permission = permission;
	}

	public String getPermission() {
		return permission;
	}
}
