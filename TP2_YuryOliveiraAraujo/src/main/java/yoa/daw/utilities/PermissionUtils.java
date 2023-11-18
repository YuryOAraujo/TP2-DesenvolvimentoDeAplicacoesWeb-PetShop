package yoa.daw.utilities;

public final class PermissionUtils {
	private PermissionUtils() {}
	
	public static boolean verifyPermission(PermissionEnum permission) {
		return permission.getPermission().equals(PermissionEnum.ADMIN.getPermission());
	}
		
	public static String obtainDashboard(PermissionEnum permission) {
		return  verifyPermission(permission) ? "/staff/dashboard" : "/client/dashboard";
	}
}
