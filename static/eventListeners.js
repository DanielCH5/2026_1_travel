import { getCountries, getTravels, getTravelsByUser } from "./api-functions.js";
import { createCard, createDialogModal } from "./domFunctions.js";
export async function loadCountries() {
    window.addEventListener("load", async () => {
        const countrySelect = document.getElementById("country_name");
        const countries = await getCountries();
        countries.map((country) => {
            const option = document.createElement("option");
            option.value = country.country_name;
            option.textContent = country.country_name;
            countrySelect.appendChild(option);
        });
    });
}
export async function loadTravels() {
    window.addEventListener("load", async () => {
        const travelGrid = document.getElementById("travelGrid");
        const response = await fetch("/api-get-current-user", {
            method: "GET"
        });
        const currentUser = await response.json();
        const travels = await getTravels();
        travels.map(travel => createCard(travel, travelGrid, currentUser));
    });
}
export async function loadTravelsByUser() {
    window.addEventListener("load", async () => {
        const travelGrid = document.getElementById("travelGrid");
        const travels = await getTravelsByUser();
        const response = await fetch("/api-get-current-user", {
            method: "GET"
        });
        const currentUser = await response.json();
        travels.map(travel => createCard(travel, travelGrid, currentUser));
    });
}
export function deleteTravel() {
    const deleteBtns = document.querySelectorAll(".deleteBtn");
    console.log(deleteBtns);
    deleteBtns.forEach((deleteBtn) => {
        deleteBtn.addEventListener("click", () => {
            createDialogModal(deleteBtn);
        });
    });
}
//# sourceMappingURL=eventListeners.js.map