import { getCountries, getTravels, GetTravelByTravelPk } from "./api-functions.js";
export async function loadCountries() {
    window.addEventListener("load", async () => {
        const countrySelect = document.getElementById("country_name")
        const countries = await getCountries();

        countries.map((country) => {
            const option = document.createElement("option");
            option.value = country.country_name;
            option.textContent = country.country_name;
            countrySelect.appendChild(option)
        })
    })
}
export async function loadTravels() {
    window.addEventListener("load", async () => {
        const travelGrid = document.getElementById("travelGrid")
        const travels = await getTravels();
        travels.map(async (travel) => {
            const travelInfo = await GetTravelByTravelPk(travel.travel_pk);
            const card = document.createElement("article");
            const cardTitle = document.createElement("h4");
            const cardDestination = document.createElement("p");
            const cardUser = document.createElement("p");
            cardTitle.textContent = travelInfo.travel_title;
            cardDestination.textContent = `${travelInfo.city_name}, ${travelInfo.city_region}, ${travelInfo.country_name}`;
            cardUser.textContent = travelInfo.user_first_name;
            card.appendChild(cardTitle);
            card.appendChild(cardDestination);
            card.appendChild(cardUser);
            card.id = travel.travel_pk;
            travelGrid.appendChild(card)
        })
    })
}
