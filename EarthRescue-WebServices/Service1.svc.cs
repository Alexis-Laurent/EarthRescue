using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace EarthRescue_webService
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service1
    {
        EarthRescueEntities db = new EarthRescueEntities();


        // Pour utiliser HTTP GET, ajoutez l'attribut [WebGet]. (ResponseFormat par défaut=WebMessageFormat.Json)
        // Pour créer une opération qui renvoie du code XML,
        //     ajoutez [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     et incluez la ligne suivante dans le corps de l'opération :
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public void DoWork()
        {
            // Ajoutez votre implémentation d'opération ici
            return;
        }

        // Ajoutez des opérations supplémentaires ici et marquez-les avec [OperationContract]

        // exemple joueur
        [OperationContract]
        public string GetJoueur(int id)
        {
            Joueur joueur = (from j in db.Joueur where j.idJoueur == id select j).First();
            return joueur.pseudoJoueur + " : " + joueur.NiveauJoueur.gradNiveauJoueur;
        }
        [OperationContract]
        public string ModifierJoueur(int id, string pseudo)
        {
            Joueur joueur = (from j in db.Joueur where j.idJoueur == id select j).First();
            joueur.pseudoJoueur = pseudo;
            db.Entry(joueur).State = EntityState.Modified;
            db.SaveChanges();
            return joueur.pseudoJoueur + " : " + joueur.NiveauJoueur.gradNiveauJoueur;
        }
        [OperationContract]
        public string SupprimerJoueur(int id)
        {
            Joueur joueur = (from j in db.Joueur where j.idJoueur == id select j).First();
            db.Joueur.Remove(joueur);
            db.SaveChanges();
            return joueur.pseudoJoueur + " Joueur supprimer ";
        }

        // exemple munition
        [OperationContract]
        public int? GetMunition(int id)
        {
            Aeronef aeronef = (from a in db.Aeronef where a.idAeronef == id select a).First();
            return aeronef.munition;
        }
        [OperationContract]
        public int? ModifierMunition(int id, int munition)
        {
            Aeronef aeronef = (from a in db.Aeronef where a.idAeronef == id select a).First();
            aeronef.munition = munition;
            db.Entry(aeronef).State = EntityState.Modified;
            db.SaveChanges();
            return aeronef.munition;
        }        

        // Interface
        // pseudo 
        [OperationContract]
        public string Get_pseudo(int id)
        {
            Joueur joueur = (from j in db.Joueur where j.idJoueur == id select j).First();
            return joueur.pseudoJoueur;
        }

        // Niveau joueur
        [OperationContract]
        public string Get_niveauJoueur(int id)
        {
            NiveauJoueur niveauJoueur = (from nj in db.NiveauJoueur where nj.idNiveauJoueur == id select nj).First();
            return niveauJoueur.gradNiveauJoueur;
        }

        // Vaisseau
        [OperationContract]
        public string Get_vaisseau(int id)
        {
            TypeAeronef typeAeronef = (from tp in db.TypeAeronef where tp.idTypeAeronef == id select tp).First();
            return typeAeronef.nomTypeAeronef;
        }

        // Vie
        [OperationContract]
        public int? Get_vie(int id)
        {
            Aeronef aeronef = (from a in db.Aeronef where a.idAeronef == id select a).First();
            return aeronef.vieAeronef;
        }

        // Munition
        [OperationContract]
        public int? Get_munition(int id)
        {
            Aeronef aeronef = (from a in db.Aeronef where a.idAeronef == id select a).First();
            return aeronef.munition;
        }
    }
}
