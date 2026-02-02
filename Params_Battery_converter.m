

%% Charge de test (Ajustée pour 10 kW à 700 V)
R_ch = 49; 

%% Qualité de signal de Batterie (Filtre)
L_Bat = 2e-3;
C_Bat = 1e-3;


%% Boucle de courant batterie niveau 1
kp_Ibat = 6.28; 
ki_Ibat = 550; 


%% Boucle de courant batterie niveau 2
kp_Vbat = 0.2; 
ki_Vbat = 20; 


%% Consignes
Vdc_ref = 700;          % Référence de tension Bus DC, Batterie