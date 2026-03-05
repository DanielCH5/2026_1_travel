const loginForm = document.getElementById("loginForm");
const submitLoginFormBtn = loginForm.querySelector("button");
const loginMessages = document.getElementById("loginErrors");
async function createLoginMessage(response) {
    const errorResponse = await response.json();
    const errorMessageListItem = document.createElement("li");
    errorMessageListItem.textContent = errorResponse.error_message;
    loginMessages.appendChild(errorMessageListItem);
}
submitLoginFormBtn.addEventListener("click", async (e) => {
    e.preventDefault();
    const response = await fetch("/api-login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            user_email: loginForm.querySelector("#loginForm_userEmail").value,
            user_password: loginForm.querySelector("#loginForm_userPassword").value
        })
    });
    if (!response.ok) {
        createLoginMessage(response);
    }
    createLoginMessage(response);
    console.log(response);
});
const loginForm_userEmail = document.getElementById("loginForm_userEmail").value;
const loginForm_userPassword = document.getElementById("loginForm_userPassword").value;
console.log(loginForm.querySelector("button"));
//# sourceMappingURL=test.js.map