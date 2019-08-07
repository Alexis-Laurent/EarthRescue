﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Voyage1.aspx.cs" Inherits="EarthRescue_webService.Voyage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="js/three.js"></script>
    <script src="js/OrbitControls.js"></script>
    <script src="js/THREEx.KeyboardState.js"></script>
    <script src="js/Detector.js"></script>
    <script src="js/immeuble_gauche.js"></script>
    <script src="js/immeuble_droit.js"></script>
    <script src="js/city.js"></script>
    <script src="js/Vaisseau_heros.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        body {
            margin: 0;
        }
        canvas {
            width: 100%;
            height: 100%
        }
        .info_joueur {
            color: white;
            padding-left: 1em;
            padding-top: 0.5em;
            font-size: 2em;
            font-family: monospace;
            position: absolute;
            width: 97%;
        }
        .info_vaisseau {
            text-align: right;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <script>
		    var scene = new THREE.Scene();
		    var camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight);
		    var renderer = new THREE.WebGLRenderer();
		    renderer.setSize(window.innerWidth, window.innerHeight);
		    document.body.appendChild(renderer.domElement);

		    camera.position.z = 9750;
		    camera.position.y = 200;

		    // Mouvement camera 
		    var controls = new THREE.OrbitControls(camera, renderer.domElement);

		    // Mouvement clavier 
		    var keyboard = new THREEx.KeyboardState();
		    var clock = new THREE.Clock();

		    // Ciel
		    var cielTexture = new THREE.ImageUtils.loadTexture('js/espace.png');
		    cielTexture.wrapS = cielTexture.wrapT = THREE.RepeatWrapping;
		    cielTexture.repeat.set(0.5, 0.5);

		    var cielGeometry = new THREE.CubeGeometry(500, 500, 20000);
		    var cielMaterial = new THREE.MeshBasicMaterial( {map: cielTexture, side: THREE.BackSide} );
		    var ciel = new THREE.Mesh(cielGeometry, cielMaterial);
		    scene.add(ciel);

		    // Vaisseau
		    var vaisseau = new vaisseauHeros2(0, 100, 9500);
		    scene.add(vaisseau);


		    // Fonction de mouvement
		    function render() {
			    requestAnimationFrame(render);
			    renderer.render(scene, camera);
			    controls.update();

			    // Vitesse camera
			    var delta = clock.getDelta();
			    var moveDistance = 3000 * delta;
			    var rotateAngle = Math.PI / 2 * delta;

			    // Avancer
			    if (keyboard.pressed("s")) {
				    vaisseau.position.z -= moveDistance;
				    camera.position.z -= moveDistance;
			    }
			    camera.lookAt(vaisseau.position);

			    if (vaisseau.position.z < -8000) {
				    window.location = 'Galaxie.aspx';
			    }
		    }
		    render();

        </script>
    </form>
</body>
</html>
