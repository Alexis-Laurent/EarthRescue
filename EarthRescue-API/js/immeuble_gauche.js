
var immeuble_gauche = function (x, y, z) {
	var immeubleTexture = new THREE.TextureLoader().load('js/immeuble_gauche.jpg');
	immeubleTexture.wrapS = immeubleTexture.wrapT = THREE.RepeatWrapping;
	immeubleTexture.repeat.set(2, 10);

	var immeubleGeometry = new THREE.BoxGeometry(40, 300, 80);
	var immeubleMaterial = new THREE.MeshBasicMaterial({ map: immeubleTexture, side: THREE.DoubleSide });

	var immeuble1 = new THREE.Mesh(immeubleGeometry, immeubleMaterial);
	immeuble1.position.x = x;
	immeuble1.position.y = y;
	immeuble1.position.z = z;

	return immeuble1;
};
