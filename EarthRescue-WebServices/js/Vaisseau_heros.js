var vaisseauHeros2 = function (x, y, z, v = 20, texture ="js/eclair.jpg"){
            
    var fuseeTexture = new THREE.ImageUtils.loadTexture(texture);
    var corpsTexture = new THREE.MeshBasicMaterial({map:fuseeTexture,side: THREE.DoubleSide});
            
    renderer.setSize(window.innerWidth,window.innerHeight);
    document.body.appendChild(renderer.domElement);
    var vaisseauCorpsGeometrie = new THREE.BoxGeometry(3*v,0.35*v,0.35*v,0.5*v);
            
    //fuselageTexture.repeat.set(2,2);            
    var corpsVaisseau = new THREE.Mesh(vaisseauCorpsGeometrie,corpsTexture);
    corpsVaisseau.rotation.y=-Math.PI/2;
    corpsVaisseau.position.x=x;
    corpsVaisseau.position.y=y;
	corpsVaisseau.position.z = z;

	//pointe vaisseau
    var pointeVaisseauGeometrie= new THREE.ConeGeometry( 0.25*v, 1.0*v, 4 );
    var pointeVaisseau = new THREE.Mesh(pointeVaisseauGeometrie,corpsTexture);
    pointeVaisseau.rotation.z=Math.PI/2;
    pointeVaisseau.rotation.x=Math.PI/4;
    pointeVaisseau.position.x=-2*v;

	//cockpit        
    var cockpitGeometrie = new THREE.ConeGeometry(0.25*v,1*v,30);
    var textureCockpit = new THREE.MeshBasicMaterial({color:"blue"});
    var cockpit = new THREE.Mesh(cockpitGeometrie,textureCockpit);
    cockpit.rotation.z=Math.PI/2;
    cockpit.position.y=0.15*v;
    cockpit.position.x=0.5*v;

	//arriere cockpit        
    var geometry = new THREE.SphereGeometry(0.25*v,30,30 );            
    var  arriereCockpit = new THREE.Mesh( geometry, textureCockpit);
    arriereCockpit.position.y=-0.5*v;
        
	//arriereVaisseau
    var arriereVaisseauGeometry = new THREE.CylinderGeometry( 0.2*v, 0.6*v,1.5*v, 4);
    var arriereVaisseau =  new THREE.Mesh(arriereVaisseauGeometry,corpsTexture);
    arriereVaisseau.rotation.z=Math.PI/2;
    arriereVaisseau.rotation.x=Math.PI/4;
    arriereVaisseau.position.x=1*v;

	//aile
	var aileGeometry = new THREE.CylinderGeometry(0.05*v,0.25*v,3*v,4);

	//aileGaucheHaut
    var aileGaucheHaut = new THREE.Mesh(aileGeometry,corpsTexture);
    aileGaucheHaut.rotation.x = Math.PI/3;
    aileGaucheHaut.rotation.z = Math.PI/8;
    aileGaucheHaut.position.x =1*v;
    aileGaucheHaut.position.y =0.7*v;
    aileGaucheHaut.position.z =1.2*v;

	//aileGaucheBas
    var aileGaucheBas = new THREE.Mesh(aileGeometry,corpsTexture);
    aileGaucheBas.rotation.x = Math.PI/2;
    aileGaucheBas.rotation.z = Math.PI/8;
    aileGaucheBas.position.x =1*v;
    aileGaucheBas.position.y =0*v;
	aileGaucheBas.position.z = 1.2 * v;

	//aileDroiteHaut
    var aileDroiteHaut = new THREE.Mesh(aileGeometry,corpsTexture);
    aileDroiteHaut.rotation.x = -Math.PI/3;
    aileDroiteHaut.rotation.z = Math.PI/8;
    aileDroiteHaut.position.x =1*v;
    aileDroiteHaut.position.y =0.7*v;
	aileDroiteHaut.position.z = -1.2 * v;

	//aileDroiteBas
    var aileDroiteBas = new THREE.Mesh(aileGeometry,corpsTexture);
    aileDroiteBas.rotation.x = -Math.PI/2;
    aileDroiteBas.rotation.z = Math.PI/8;
    aileDroiteBas.position.x =1*v;
    aileDroiteBas.position.y =0*v;
    aileDroiteBas.position.z =-1.2*v;

	//Cylindre attache aille avant
    var attacheGeometry = new THREE.CylinderGeometry(0.05*v,0.05*v,1.2*v,32);
    var attache = new THREE.Mesh(attacheGeometry,corpsTexture);
    attache.rotation.x=-Math.PI/2

	//aile avant droite
    //partie1
    var aileAvantGeometrie = new THREE.CylinderGeometry(0.1*v,0.3*v,2*v,32);
    var aileAvantDroite = new THREE.Mesh(aileAvantGeometrie,corpsTexture);
    aileAvantDroite.rotation.z=Math.PI/2;
            
    aileAvantDroite.position.y=0.6*v;
	aileAvantDroite.position.x = -0.7 * v;

	//partie2
    var aileAvantPartie2 = new THREE.CylinderGeometry(0.3*v,0.1*v,0.5*v,32);
	var aileAvantDroitePartie2 = new THREE.Mesh(aileAvantPartie2, corpsTexture);

    //partie3
    var aileAvantDroitePartie3= new THREE.Mesh(aileAvantPartie2,corpsTexture);
    aileAvantDroitePartie3.rotation.y=Math.PI/2;
    aileAvantDroitePartie3.position.y=-1.25*v;
            
	//aile avant gauche
    //partie1
    var aileAvantGauche = new THREE.Mesh(aileAvantGeometrie,corpsTexture);
    aileAvantGauche.rotation.z=Math.PI/2;
            
    aileAvantGauche.position.y=-0.6*v;
    aileAvantGauche.position.x=-0.7*v;
    //partie2
    var aileAvantGauchePartie2 = new THREE.Mesh(aileAvantPartie2,corpsTexture);
    //partie3
    var aileAvantGauchePartie3= new THREE.Mesh(aileAvantPartie2,corpsTexture);
    aileAvantGauchePartie3.rotation.y=Math.PI/2;
    aileAvantGauchePartie3.position.y=-1.25*v;

	//aile arriere
	//var aileArriereGeometry = new THREE.CylinderGeometry(0.4*v,0.3*v,0.5*v,4);    
	
    var reacteurGeometrie = new THREE.CylinderGeometry(0.2*v,0.3*v,0.3*v,32);
    var reacteur = new THREE.Mesh(reacteurGeometrie,corpsTexture);
    reacteur.rotation.z=Math.PI/2;
	reacteur.position.x=1.9*v; 

	//mise en place
    corpsVaisseau.add(pointeVaisseau);
    corpsVaisseau.add(cockpit);
    corpsVaisseau.add(aileGaucheHaut);
    corpsVaisseau.add(aileGaucheBas);
    corpsVaisseau.add(aileDroiteHaut);
    corpsVaisseau.add(aileDroiteBas);
    corpsVaisseau.add(attache);
    attache.add(aileAvantDroite);
    aileAvantDroite.add(aileAvantDroitePartie2);
    aileAvantDroite.add(aileAvantDroitePartie3);
    attache.add(aileAvantGauche);
    aileAvantGauche.add(aileAvantGauchePartie2);
    aileAvantGauche.add(aileAvantGauchePartie3);
    cockpit.add( arriereCockpit );
    corpsVaisseau.add(arriereVaisseau);
    corpsVaisseau.add(reacteur);            

    //scene.add(corpsVaisseau);
    function animateRay(){
        timerTournicoti=setInterval(tournicoti,5);
    }
    function tournicoti(){
        aileAvantDroite.rotation.x+=0.05;
        aileAvantGauche.rotation.x-=0.05;                              
    }
    animateRay();   
    return corpsVaisseau;
}
