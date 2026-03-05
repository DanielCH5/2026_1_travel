const loginForm = document.getElementById("loginForm");

const submitLoginFormBtn = loginForm.querySelector("button");
const loginMessages = document.getElementById("loginErrors");

async function createLoginMessage(errorResponse) {
    const errorMessageListItem = document.createElement("li");

    errorMessageListItem.textContent = errorResponse.error_message;

    loginMessages.appendChild(errorMessageListItem)
}

submitLoginFormBtn.addEventListener("click", async (e) => {
    e.preventDefault();
    loginMessages.textContent = ""
    const userEmail = (loginForm.querySelector("#loginForm_userEmail") as HTMLInputElement).value;
    const userPassword = (loginForm.querySelector("#loginForm_userPassword") as HTMLInputElement).value;
    if (!userEmail.trim()) {
        const errorResponse = { error_message: "Please enter your email" }
        createLoginMessage(errorResponse);
    }
    if (!userPassword.trim()) {
        const errorResponse = { error_message: "Please enter your password" }
        createLoginMessage(errorResponse);
        return;
    }

    const response = await fetch("/api-login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            user_email: userEmail,
            user_password: userPassword
        })
    })

    if (!response.ok) {
        const errorResponse = await response.json();
        return createLoginMessage(errorResponse)
    }


    const errorResponse = await response.json();
    createLoginMessage(errorResponse)
    setTimeout(() => {
        window.location.replace("/")
    }, 1000)
})





