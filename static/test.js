const loginForm = document.getElementById("loginForm");
const submitLoginFormBtn = loginForm.querySelector("button");
const loginMessages = document.getElementById("loginMessages");
const USER_EMAIL_REGEX = document.getElementById("userEmail").getAttribute("data-regex");
const USER_PASSWORD_REGEX = document.getElementById("userPassword").getAttribute("data-regex");
const USER_PASSWORD_MIN = document.getElementById("userPassword").getAttribute("data-min");
const USER_PASSWORD_MAX = document.getElementById("userPassword").getAttribute("data-max");
async function createLoginMessage(errorResponse) {
    const errorMessageListItem = document.createElement("li");
    errorMessageListItem.textContent = errorResponse.error_message;
    loginMessages.appendChild(errorMessageListItem);
}
loginForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    loginMessages.textContent = "";
    const formData = new FormData(loginForm);
    const user_email = formData.get("user_email").toString();
    const user_password = formData.get("user_password").toString();
    if (!user_email.match(USER_EMAIL_REGEX)) {
        const errorResponse = { error_message: "Please enter a valid email" };
        createLoginMessage(errorResponse);
    }
    if (!user_password.match(USER_PASSWORD_REGEX)) {
        const errorResponse = { error_message: `Password must be between ${USER_PASSWORD_MIN} and ${USER_PASSWORD_MAX}` };
        createLoginMessage(errorResponse);
        return;
    }
    else if (!user_email.match(USER_EMAIL_REGEX)) {
        // Prevent from making call to server 
        return;
    }
    const response = await fetch("/api-login", {
        method: "POST",
        body: formData
    });
    if (!response.ok) {
        const errorResponse = await response.json();
        return createLoginMessage(errorResponse);
    }
    const errorResponse = await response.json();
    createLoginMessage(errorResponse);
    setTimeout(() => {
        window.location.replace("/");
    }, 1000);
});
//# sourceMappingURL=test.js.map