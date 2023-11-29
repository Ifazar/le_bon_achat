import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("calcul controller 1 connected")
  }
  static targets = ["results", "picture2", "hash"]

  
  updatePrice(event) {

    const hashTest = {
      "Divertissement": [["Jeux/Jouet/Jeux de société"], ["Livre/BD/Manga"]],
      "Electrique": [["Electroménager"], ["Télévision/Ecran/Enceinte"]],
      "Mobilier": [["Canapé/Fauteuil"], ["Commode/Etagére"], ["Chaise"], ["Exterieur"]],
      "Jardinage": [["Pot/Mobilier"], ["Outils"]],
      "Sport": [["Vélo"], ["Matériel en tout genre"]],
    };

    function getKeyByValue(object, value) {
      for (const key in object) {
        if (object[key].some(arr => arr.includes(value))) {
          return key;
        }
      }
      return null; // Retourne null si la valeur n'est pas trouvée
    }
    // Récupérer les valeurs sélectionnées dans les formulaires
    const selectElement = document.querySelector('#category select');
    const selectedOption = selectElement.options[selectElement.selectedIndex];

    // Récupérer l'option sélectionnée
    let keyClicked = (selectedOption.value)
    const selectedCategory = getKeyByValue(hashTest, keyClicked);


    const selectedCond = document.querySelector('#condition select').value;
    const calculatePrice = (category, condition) => {

      switch (condition) {
        case "Très Bon":
        switch (category) {
          case "Divertissement": return "7";
          case "Electrique":
          case "Sport": return "30";
          default: return "20";
        }
        case "Bon":
        switch (category) {
          case "Divertissement": return "4";
          case "Electrique":
          case "Sport": return "20";
          default: return "15";
        }
        case "Moyen":
        switch (category) {
          case "Divertissement": return "2";
          case "Electrique":
          case "Sport": return "15";
          default: return "10";
        }
        default:
        switch (category) {
          case "Divertissement": return "1";
          case "Electrique":
          case "Sport": return "10";
          default: return "5";
        }
      }

    }
    // Calculer le prix en utilisant ces valeurs
    const price = calculatePrice(selectedCategory, selectedCond);
    // Mettre à jour le contenu de la balise <span>
    document.getElementById("priceDisplay").innerText = `Votre Coupon : ${price} €`;
  }

  addPicture1() {
    var element = document.getElementById("picture2")
    console.log(element)
    element.style.display = "block"
  }
  addPicture2() {
    var element = document.getElementById("picture3")
    console.log(element)
    element.style.display = "block"
  }

}
