var city = function (x, y, z, mathX, mathY, operateur, type, quantite) {
	var immeuble = null;
	var immeubles = [];

	for (var i = 0; i < quantite; i++) {

		switch (type) {			
			case "immeuble_droit":
				immeuble = new immeuble_droit(x, y, z);
				break;
			case "immeuble_gauche":
				immeuble = new immeuble_gauche(x, y, z);
				break;
			default:
				break;
		}

	var posX = 0;

		switch (operateur) {
			case "+":
				posX = immeuble.position.x + (Math.random()) * mathX;
				break;
			case "-":
				posX = immeuble.position.x - (Math.random()) * mathX;
				break;
			default:
				break;
		}
		var posY = immeuble.position.y;
		var posZ = immeuble.position.z + (Math.random()) * mathY;

		immeuble.position.x = posX;
		immeuble.position.y = posY;
		immeuble.position.z = posZ;
		immeubles[i] = immeuble;
	}
	return immeubles;
};
