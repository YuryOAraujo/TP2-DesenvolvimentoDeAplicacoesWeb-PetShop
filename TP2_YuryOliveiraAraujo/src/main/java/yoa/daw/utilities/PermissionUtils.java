package yoa.daw.utilities;

public final class PermissionUtils {
	private PermissionUtils() {}
		
	public static String obtainDashboard(PermissionEnum permission) {
		return permission.getPermission().equals(PermissionEnum.ADMIN.getPermission()) ? "staff/dashboard" : "client/dashboard";
	}
}
