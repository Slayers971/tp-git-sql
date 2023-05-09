function askUsername() {
    return prompt("Quel est votre nom d'utilisateur ?");
    }
    
    
    function askMathOperation() {
    return prompt("Combien font 2 + 2 ?");
    }
    
    
    function success() {
        alert("Vous pouvez accéder à l'application.");
    }
    
    function error() {
        alert("Restez où vous êtes.");
    }
    
    
    function checkUsername() {
    return new Promise((resolve, reject) => {
    const username = askUsername();
    if (username === "admin") {
    resolve();
    } else {
    reject();
    }
    });
    }
    
    
    function checkIfIsBot() {
    return new Promise((resolve, reject) => {
    const mathResult = askMathOperation();
    if (mathResult === "4") {
    resolve();
    } else {
    reject();
    }
    });
    }
    
    

  // Résolution des promesses
  Promise.all([checkUsername(), checkIfIsBot()])
    .then(() => {
      return success();
    })
    .catch(() => {
      return error();
    })