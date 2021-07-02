(function($) {
    $.fn.changeColor = function(options) {
        // element(s) qui appelle le plugin : this
        // console.log(this);

        // paramètres par défaut
        let settings = {
            delay: 500
        };

        // fusionner les paramètres passés avec les paramètres par défaut
        if (options) {
            $.extend(settings, options);
        }

        // this ici est l'élément jquery (la sélection d'un ou plusieurs)
        this.each(function() {
            // dans le callback ici this vaut l'élément javascript
            let elementJS = this;
            setInterval(function() {
                elementJS.style.color = getRandomColor();
            }, settings.delay);
        });

        // fonction classique dans le plugin
        function getRandomColor() {
            // #09AFF3
            let chars = "0123456789ABCDEF";
            let color = "#";

            for (let i = 0; i <= 5; i++) {
                // générer un indice aléatoire entre 0 et 15
                let position = randomIntFromInterval(0, 15);
                // aller chercher le caractère correspondant
                let char = chars[position];
                // l'ajouter dans le code couleur
                color += char;
                // console.log(color);
            }

            return color;
        }

        function randomIntFromInterval(min, max) { // min and max included
            return Math.floor(Math.random() * (max - min + 1) + min)
        }
    };
})(jQuery);