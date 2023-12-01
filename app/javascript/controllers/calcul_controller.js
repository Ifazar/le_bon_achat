import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["results", "picture2", "hash"]

  connect() {
    console.log("calcul controller 1 connected")

  }

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
    // document.getElementById("priceDisplay").innerText = `Votre Coupon : ${price} €`;

    this.resultsTarget.innerText = `Votre Coupon : ${price} €`;
    const calculatedPriceInput = document.getElementById("calculatedPriceInput");
    calculatedPriceInput.value = price;

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



  updateSummary() {
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
    // Implémentez la logique de mise à jour du récapitulatif
    const productName = this.element.querySelector("input[name='product[title]']").value;
    const selectElement = document.querySelector('#category select');
    const selectedOption = selectElement.options[selectElement.selectedIndex];

    // Récupérer l'option sélectionnée
    let keyClicked = (selectedOption.value)
    const category = getKeyByValue(hashTest, keyClicked);
    const condition = this.element.querySelector("select[name='product[condition]']").value;
    const picture1 = this.element.querySelector("input[name='product[picture1]']").value;
    const picture2 = this.element.querySelector("input[name='product[picture2]']").value;
    const picture3 = this.element.querySelector("input[name='product[picture3]']").value;

    let picturesSummary = '';
    if (picture1 || picture2 || picture3) {
      picturesSummary = `<p><strong>Photos:</strong> ${picture1} ${picture2} ${picture3}</p>`;
    }

    const productDetails = this.element.querySelector("#product-details");
    productDetails.innerHTML = `
      <p><strong>Nom de l'objet:</strong> ${productName}</p>
      <p><strong>Catégorie:</strong> ${category}</p>
      <p><strong>État:</strong> ${condition}</p>
      ${picturesSummary}
    `;
  }

  showPopup() {
    // Implémentez la logique pour afficher la popup
    this.updateSummary();
    this.element.querySelector("#overlay").style.display = "block";
    this.element.querySelector("#summary-popup").style.display = "block";


  }

  hidePopup() {
    // Implémentez la logique pour masquer la popup
    this.element.querySelector("#overlay, #summary-popup").style.display = "none";
  }

  onSubmit(event) {
    // Empêcher la soumission du formulaire et afficher la popup
    event.preventDefault();
    this.showPopup();
  }

  onCancel() {
    // Implémentez la logique pour annuler
    this.hidePopup();
    this.element.querySelector("#summary-popup").style.display = "none";

  }

  onValidate() {
    // Implémentez la logique pour valider
    this.hidePopup();
    this.element.querySelector("form").removeEventListener("submit", this.onSubmit.bind(this));
    this.element.querySelector("form").submit();
  }

  onOverlayClick() {
    // Implémentez la logique pour masquer la popup lors du clic sur l'overlay
    this.hidePopup();
  }
}

