import { deleteTravelByTravelPk } from "./api-functions.js";
export async function createDialogModal(deleteBtn) {
    const dialog = document.createElement("dialog");
    const p = document.createElement("p");
    p.textContent = "Are you SURE you want to DELETE this travel?";
    const cancelBtn = document.createElement("button");
    const yesBtn = document.createElement("button");
    cancelBtn.textContent = "Cancel";
    yesBtn.textContent = "Yes, Delete this";
    cancelBtn.addEventListener("click", () => {
        dialog.close();
        dialog.remove(); // Removes from DOM so we dont end up with duplicates
    });
    yesBtn.addEventListener("click", async () => {
        const travelPk = deleteBtn.id;
        const response = await deleteTravelByTravelPk(travelPk);
        if (response.ok) {
            if (window.location.href === `http://127.0.0.1/travel/${travelPk}`) {
                window.location.href = "/";
            }
            else {
                document.getElementById(`travel-${travelPk}`).remove();
                dialog.close();
                dialog.remove();
            }
        }
    });
    dialog.appendChild(p);
    dialog.appendChild(cancelBtn);
    dialog.appendChild(yesBtn);
    document.body.append(dialog);
    dialog.showModal();
}
export function createCard(travel, travelGrid, currentUser) {
    const cardLink = document.createElement("a");
    cardLink.href = `/travel/${travel.travel_pk}`;
    const card = document.createElement("article");
    const cardTitle = document.createElement("h4");
    const cardDestination = document.createElement("p");
    const cardUser = document.createElement("p");
    const cardDates = document.createElement("p");
    const cardCreated = document.createElement("p");
    const cardInfo = document.createElement("div");
    cardTitle.textContent = travel.travel_title;
    cardDestination.textContent = `${travel.city_name}, ${travel.city_region}, ${travel.country_name}`;
    cardUser.textContent = `User: ${travel.user_first_name} ${travel.user_last_name}`;
    cardDates.textContent = `${new Date(travel.travel_date_from * 1000).toDateString()} - ${new Date(travel.travel_date_to * 1000).toDateString()}`;
    cardCreated.textContent = `Posted: ${new Date(travel.travel_created_at * 1000).toDateString()}`;
    cardInfo.appendChild(cardTitle);
    cardInfo.appendChild(cardDestination);
    cardInfo.appendChild(cardDates);
    cardInfo.appendChild(cardUser);
    cardInfo.appendChild(cardCreated);
    cardLink.appendChild(cardInfo);
    card.id = `travel-${travel.travel_pk}`;
    card.classList.add("travelCard");
    card.appendChild(cardLink);
    if (currentUser.user_pk === travel.user_fk) {
        const deleteBtn = document.createElement("button");
        deleteBtn.id = travel.travel_pk;
        deleteBtn.classList.add("deleteBtn");
        deleteBtn.textContent = "Delete travel?";
        deleteBtn.addEventListener("click", () => {
            createDialogModal(deleteBtn);
        });
        card.appendChild(deleteBtn);
    }
    travelGrid.appendChild(card);
}
//# sourceMappingURL=domFunctions.js.map