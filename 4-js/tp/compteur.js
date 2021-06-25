
let delay = 60;

function compteur() {
    setTimeout(function() {
        delay -= 1;

        if (delay <= 0) {
            // compteur écoulé
        }
        else {
            compteur();
        }

    }, 1000)
}