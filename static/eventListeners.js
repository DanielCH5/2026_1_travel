import { getCountries, getTravels, getTravelsByUser, deleteTravelByTravelPk } from "./api-functions.js";
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
export function deleteTravel() {
    const deleteBtn = document.getElementById("deleteBtn");
    deleteBtn.addEventListener("click", () => {
        const dialog = document.createElement("dialog");
        const p = document.createElement("p");
        p.textContent = "Are you SURE you want to DELETE this travel?";
        const cancelBtn = document.createElement("button");
        const yesBtn = document.createElement("button");
        cancelBtn.textContent = "Cancel";
        yesBtn.textContent = "Yes, Delete this";
        cancelBtn.addEventListener("click", () => {
            dialog.close();
        });
        yesBtn.addEventListener("click", async () => {
            const travelPk = deleteBtn.dataset.travelpk;
            const response = await deleteTravelByTravelPk(travelPk);
            if (response.ok) {
                window.location.href = "/";
            }
        });
        dialog.appendChild(p);
        dialog.appendChild(cancelBtn);
        dialog.appendChild(yesBtn);
        document.body.append(dialog);
        dialog.showModal();
    });
}
//# sourceMappingURL=eventListeners.js.map