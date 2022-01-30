package classic.enumeration;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public enum ExplanatoryMessages {

    USER_NOT_FOUND_BY_USERNAME("User with this email is not found"),
    USER_NOT_FOUND_BY_EMAIL("User with this email is not found"),
    USERNAME_IS_REGISTERED("This username is already registered"),
    MAIL_IS_REGISTERED("This mail is already registered"),
    INVALID_CONFIRM_PASSWORD("Passwords don't match."),
    EMPTY_FIELDS("Fields mustn't be empty.");

    private final String message;

    @Override
    public String toString() {
        return message;
    }
}
