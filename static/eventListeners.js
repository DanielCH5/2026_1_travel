import { getCountries, getTravels, getTravelsByUser } from "./api-functions.js";
import { createCard } from "./domFunctions.js";
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
        const travels = await getTravels();
        console.log(travels);
        travels.map(travel => createCard(travel, travelGrid));
    });
}
export async function loadTravelsByUser() {
    window.addEventListener("load", async () => {
        const travelGrid = document.getElementById("travelGrid");
        const travels = await getTravelsByUser();
        travels.map(travel => createCard(travel, travelGrid));
    });
}
//# sourceMappingURL=eventListeners.js.map