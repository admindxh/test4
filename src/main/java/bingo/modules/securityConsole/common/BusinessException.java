/**
 * This file created at 2011-1-6.
 *
 * Copyright (c) 2002-2011 Bingosoft, Inc. All rights reserved.
 */
package bingo.modules.securityConsole.common;

/**
 * <code>{@link BusinessException}</code>
 *
 * TODO : document me
 *
 * @author Administrator
 */
public class BusinessException extends RuntimeException {
	 private static final long serialVersionUID = -2833246968464575085L;

		public BusinessException() {

		}

		public BusinessException(String message) {
			super(message);
		}

		public BusinessException(Throwable cause) {
			super(cause);
		}

		public BusinessException(String message, Throwable cause) {
			super(message, cause);
		}
}
