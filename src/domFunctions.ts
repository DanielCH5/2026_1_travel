export async function createCard(travel, travelGrid) {
    const cardLink = document.createElement("a");
    cardLink.href = `/travel/${travel.travel_pk}`;
    const card = document.createElement("article");
    const cardTitle = document.createElement("h4");
    const cardDestination = document.createElement("p");
    const cardUser = document.createElement("p");
    cardTitle.textContent = travel.travel_title;
    cardDestination.textContent = `${travel.city_name}, ${travel.city_region}, ${travel.country_name}`;
    cardUser.textContent = travel.user_first_name;
    card.appendChild(cardTitle);
    card.appendChild(cardDestination);
    card.appendChild(cardUser);
    card.id = travel.travel_pk;
    card.classList.add("travelCard");
    cardLink.appendChild(card)
    travelGrid.appendChild(cardLink);
}

