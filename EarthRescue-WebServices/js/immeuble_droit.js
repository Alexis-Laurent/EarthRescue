var immeuble_droit = function (x, y, z) {
	var immeubleTexture2 = new THREE.TextureLoader().load('js/immeuble3.png');
	immeubleTexture2.wrapS = immeubleTexture2.wrapT = THREE.RepeatWrapping;
	immeubleTexture2.repeat.set(2, 10);

	var immeubleGeometry2 = new THREE.BoxGeometry(40, 300, 80);
	var immeubleMaterial2 = new THREE.MeshBasicMaterial({ map: immeubleTexture2, side: THREE.DoubleSide });

	var immeuble1 = new THREE.Mesh(immeubleGeometry2, immeubleMaterial2);
	immeuble1.position.x = x;
	immeuble1.position.y = y;
	immeuble1.position.z = z;

	return immeuble1;
};
