<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Galaxie.aspx.cs" Inherits="EarthRescue_webService.Galaxie" %>

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

        <div class="info_joueur">
            <div id="joueur"></div>
            <div id="niveau"></div>
            <div id="vaisseau" class="info_vaisseau"></div>
            <div id="vie" class="info_vaisseau"></div>
            <div id="munition" class="info_vaisseau"></div>
        </div>

        <script>
		    var scene = new THREE.Scene();
		    var camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight);
		    var renderer = new THREE.WebGLRenderer();
		    renderer.setSize(window.innerWidth, window.innerHeight);
		    document.body.appendChild(renderer.domElement);

		    camera.position.z = 500;
		    camera.position.y = 200;

		    // Mouvement camera 
		    var controls = new THREE.OrbitControls(camera, renderer.domElement);

		    // Mouvement clavier 
		    var keyboard = new THREEx.KeyboardState();
		    var clock = new THREE.Clock();

		    // Ciel
		    var galaxyTexture=new THREE.ImageUtils.loadTexture('js/galaxie.jpg');
		    galaxyTexture.wrapS=galaxyTexture.wrapT=THREE.RepeatWrapping;
		    galaxyTexture.repeat.set(1, 1);

		    var galaxyGeometry = new THREE.SphereGeometry( 1300, 32, 32 );
		    var galaxyMaterial = new THREE.MeshBasicMaterial( {map:galaxyTexture,side:THREE.DoubleSide} );
		    var galaxy = new THREE.Mesh(galaxyGeometry, galaxyMaterial);
		    scene.add(galaxy);

		    // Soleil
		    var soleilTexture=new THREE.ImageUtils.loadTexture('js/soleil.jpg');
            soleilTexture.wrapS=soleilTexture.wrapT=THREE.RepeatWrapping;
		    soleilTexture.repeat.set(1, 1);

		    var soleilGeometry = new THREE.SphereGeometry( 200, 32, 32 );
		    var soleilMaterial = new THREE.MeshBasicMaterial( {map:soleilTexture,side:THREE.DoubleSide} );
		    var soleil = new THREE.Mesh(soleilGeometry, soleilMaterial);

		    scene.add(soleil);
		    soleil.position.x= -700;
		    soleil.position.y = 200;
		    soleil.position.z = -700;

		    // Vaisseau
		    var vaisseau = new vaisseauHeros2(0, 100, 0);
		    scene.add(vaisseau);


		    // Fonction de mouvement
		    function render() {
			    requestAnimationFrame(render);
			    renderer.render(scene, camera);
			    controls.update();

			    soleil.rotation.y += 0.002;

			    // Vitesse camera
			    var delta = clock.getDelta();
			    var moveDistance = 150 * delta;
			    var rotateAngle = Math.PI / 2 * delta;

                // Droite
                if (keyboard.pressed("x")) {
                    vaisseau.position.x += moveDistance;
                    camera.position.x += moveDistance;
                }
                // Gauche
                if (keyboard.pressed("w")) {
                    vaisseau.position.x -= moveDistance;
                    camera.position.x -= moveDistance;
                }
                // Haut
                if (keyboard.pressed("z")) {
                    vaisseau.position.y += moveDistance;
                    camera.position.y += moveDistance;
                }
                // Bas
                if (keyboard.pressed("a")) {
                    vaisseau.position.y -= moveDistance;
                    camera.position.y -= moveDistance;
                }
                // Avancer
                if (keyboard.pressed("s")) {
                    vaisseau.position.z -= moveDistance;
                    camera.position.z -= moveDistance;
                }
                // Reculer
                if (keyboard.pressed("q")) {
                    vaisseau.position.z += moveDistance;
                    camera.position.z += moveDistance;
                }
                // Tourner à droite
                if (keyboard.pressed("v")) {
                    vaisseau.rotation.y -= 0.1;
                    camera.rotation.y -= 0.1;
                }
                // Tourner à gauche
                if (keyboard.pressed("c")) {
                    vaisseau.rotation.y += 0.1;
                    camera.rotation.y += 0.1;
                }
			    camera.lookAt(vaisseau.position);
		    }
            render();	


            // Web services
            // Pseudo
            function Get_pseudo() {
                Service1.Get_pseudo(3, Afficher_joueur);
            }
            Get_pseudo();
            function Afficher_joueur(result) {
                var myres = document.getElementById("joueur");
                myres.innerHTML = result;
            }

            // Niveau joueur
            function Get_niveauJoueur() {
                Service1.Get_niveauJoueur(1, Afficher_niveauJoueur);
            }
            Get_niveauJoueur();
            function Afficher_niveauJoueur(result) {
                var myres = document.getElementById("niveau");
                myres.innerHTML = result;
            }

            // Vaisseau
            function Get_vaisseau() {
                Service1.Get_vaisseau(1, Afficher_vaisseau);
            }
            Get_vaisseau();
            function Afficher_vaisseau(result) {
                var myres = document.getElementById("vaisseau");
                myres.innerHTML = result;
            }

            // Vie
            function Get_vie() {
                Service1.Get_vie(1, Afficher_vie);
            }
            Get_vie();
            function Afficher_vie(result) {
                var myres = document.getElementById("vie");
                myres.innerHTML = result;
            }

            // Munition
            function Get_munition() {
                Service1.Get_munition(1, Afficher_munition);
            }
            Get_munition();
            function Afficher_munition(result) {
                var myres = document.getElementById("munition");
                myres.innerHTML = result;
            }

        </script>

        <asp:scriptmanager ID="ScriptManager1" runat="server" >
            <Services>
                <asp:ServiceReference Path="~/Service1.svc"/>
            </Services>
        </asp:scriptmanager>

    </form>
</body>
</html>
