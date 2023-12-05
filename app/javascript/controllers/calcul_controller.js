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
          case "Electroménager": return "50";
          case "Jeux & Jouet":
          case "Décoration": return "15";
          case "Vélo": return "40";
          case "Ameublement":
          case "Sport & Plein air":
          case "Bricolage": return "20";
          case "Loisirs créatifs":
          case "Livres / Mangas & BD":
          case "Jardin & Plantes": return "10";
          case "Mode": return "25";
          case "Electronique": return "60";
          default: return "20";
        }
        case "Bon":
        switch (category) {
          case "Electroménager": return "30";
          case "Jeux & Jouet":
          case "Décoration": return "10";
          case "Vélo": return "25";
          case "Ameublement":
          case "Sport & Plein air":
          case "Bricolage": return "15";
          case "Loisirs créatifs":
          case "Livres / Mangas & BD":
          case "Jardin & Plantes": return "8";
          case "Mode": return "20";
          case "Electronique": return "40";
          default: return "15";
        }
        case "Moyen":
        switch (category) {
          case "Electroménager": return "20";
          case "Décoration": return "8";
          case "Vélo": return "20";
          case "Ameublement":
          case "Mode":
          case "Sport & Plein air":
          case "Bricolage": return "10";
          case "Jeux & Jouet":
          case "Loisirs créatifs":
          case "Livres / Mangas & BD":
          case "Jardin & Plantes": return "5";
          case "Electronique": return "30";
          default: return "10";
        }
        default:
        switch (category) {
          case "Electroménager": return "10";
          case "Bricolage":
          case "Ameublement":
          case "Sport & Plein air":
          case "Décoration": return "5";
          case "Vélo": return "15";
          case "Jeux & Jouet":
          case "Jardin & Plantes": return "2";
          case "Mode": return "7";
          case "Electronique": return "20";
          case "Livres / Mangas & BD":
          case "Loisirs créatifs": return "3";
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
    const productDetails = this.element.querySelector("#product-details");
    productDetails.innerHTML = `
    <p><strong>Nom de l'objet:</strong> ${productName}</p>
    <p><strong>Catégorie:</strong> ${category}</p>
    <p><strong>État:</strong> ${condition}</p>
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
