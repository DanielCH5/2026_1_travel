export async function getCountries() {
    try {
        const route = "/api-get-countries";
        const response = await fetch(route, {
            method: "GET",
        });
        const data = await response.json();
        return data;
    }
    catch (error) {
        console.log("ups");
    }
}
export async function getTravels() {
    try {
        const route = "/api-get-travels";
        const response = await fetch(route, {
            method: "GET",
        });
        const data = await response.json();
        return data;
    }
    catch (error) {
        console.log("ups");
    }
}
export async function getTravelByTravelPk(travel_pk) {
    try {
        const route = `/api-get-travel/${travel_pk}`;
        const response = await fetch(route, {
            method: "GET",
        });
        const travelInfo = await response.json();
        return travelInfo;
    }
    catch (error) {
        console.log("ups");
    }
}
export async function getTravelsByUser() {
    try {
        const route = `/api-get-travels-by-user`;
        const response = await fetch(route, {
            method: "GET",
        });
        const travelInfo = await response.json();
        return travelInfo;
    }
    catch (error) {
        console.log("ups");
    }
}
export async function deleteTravelByTravelPk(travel_pk) {
    try {
        const route = `/api-delete-travel/${travel_pk}`;
        const response = await fetch(route, {
            method: "DELETE",
        });
        const data = await response;
        console.log(data);
        return data;
    }
    catch (error) {
        console.log("ups");
    }
}
//# sourceMappingURL=api-functions.js.map