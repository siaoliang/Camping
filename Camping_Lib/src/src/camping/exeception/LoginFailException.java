package src.camping.exeception;

public class LoginFailException extends CAMPException {

	public LoginFailException() {
		super("登入失敗,帳號密碼不正確");
	}

	public LoginFailException(String message, Throwable cause) {
		super(message, cause);
	}

	public LoginFailException(String message) {
		super(message);
	}
}
