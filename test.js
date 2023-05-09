function mySandwich(ingredient1, ingredient2, callback) {
    alert("Votre sandwich contient " + ingredient1 + " et " + ingredient2);
    callback();
}

function endSandwich() {
    alert("Bon appétit !");
}

mySandwich("jambon", "fromage", endSandwich);
