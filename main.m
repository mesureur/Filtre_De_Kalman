load('Data2.mat')

taille=size(CAN_Prius__vehicle_speed_7e0, 1);

%On supprimme la dernière ligne de "CAN_Prius__vehicle_speed_7e0"
%Sinon problème avec la fonction d'approximation
CAN_Prius__vehicle_speed_7e0(taille,:)=[];         
taille = taille - 1;


%Synchronisation des données expérimentales

%Synchronisation sur les données de "CAN_Prius__vehicle_speed_7e0" car ce
%capteur possède le Tacq le plus faible
MatriceCapteurs=zeros(taille, 4);
MatriceCapteurs(:,1:2)=CAN_Prius__vehicle_speed_7e0;

for i=(1:taille)
    MatriceCapteurs(i,3)=approximation(CAN_Prius__vehicle_speed_7e2, CAN_Prius__vehicle_speed_7e0(i,1));
    MatriceCapteurs(i,4)=approximation(S_Sensoren_II_v1_0__DataFrame1__v, CAN_Prius__vehicle_speed_7e0(i,1));
end


%Modèle d'ordre 0
%aka vitesse constante
 
%choix des matrices A, H et estimer des matrices Q et R à partir des données
%expérimentales. Les résultats du filtrage et notamment le gain de Kalman K doivent
%être affichés pour vérifier le bon fonctionnement du filtre ;


A=eye(3);
