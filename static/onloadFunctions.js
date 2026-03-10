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
//# sourceMappingURL=onloadFunctions.js.map