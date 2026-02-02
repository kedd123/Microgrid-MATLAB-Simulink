clear; clc;
%% Turbine
R  = 3.96;                    % Rayon pale (m)
S  = pi*R^2;                 % Surface balayée (m²)
rho = 1.225;                 % Masse volumique air (kg/m³)
beta=0;

%% Coefficients Cp
A1 = 0.548;   A2 = 116;  A3 = 0.4;
A4 = 5;      A5 = -21;  A6 = 0.0068;


%% Gearbox
G = 6.24;

% Simulation
Ts = 1e-6; 
Fc=8000;


%%  PMSG
P_nom=25000;
F=0.0004924;        % Coefficient de frottement visqueux (N.m.s/rad) 
J_PMSG=0.2227;
Rs = 0.0485;
Ls = 0.000395;
Phi_r = 0.1194;
p  = 4;          % Nombre de paires de pôles
J= J_PMSG;


%%  Boucle de comande de redresseur
%%  Boucle courant d-axis
kp_isd = 2.75;    
ki_isd = 13800;
Id_ref=0;

%%  Boucle courant q-axis
kp_isq=kp_isd ;   
ki_isq=ki_isd;   
%   Isq_ref = sortie de boucle de omrga*(1 / (1.5 × p × Φr))


%%  boucle de régulation de vitesse 
kp_omega =3.108 ; 
ki_omega =  0.6873;


% Constante de couple de la machine
Kt = 1.5 * p * Phi_r;

% Gain 1 : Pour compenser le Couple (FeedForward Torque)
Gain_FF_Torque = 1 / Kt;

% Gain 2 : Pour compenser l'Inertie (FeedForward Accélération)
Gain_FF_Accel = J_PMSG / Kt;




%%  filtre de sortie dc ( Redresseur actif )
C_dc =4.5e-3;





%% coté réseau
%% coté réseau (Vdc plus nerveux)
W_vdc = 80;              % 80 rad/s (au lieu de 50)
kp_vdc = 2 * C_dc * W_vdc;  % 2 * 0.0045 * 80 = 0.72
ki_vdc = C_dc * W_vdc^2;    % 0.0045 * 6400 = 28.8
Vdc_ref=700;



%% Boucle de courant Idq= Park(Iabc)
%   Axe_d
kp_id_grid = 4.5;      % Au lieu de 16
ki_id_grid = 225;    % Au lieu de 300
id_grid_ref=0;



%   Axe_q
kp_iq_grid = kp_id_grid;
ki_iq_grid = ki_id_grid;



%% Boucle de facteur de puissance (Q)
kp_Q = 0.0005;
ki_Q = 0.05;

%% Boucle PLL
kp_PLL = 180;   
ki_PLL = 3200;   

%% Filtre Onduleur
Lf = 8e-3;    
Rf = 0.01;    

%% Modèle de réseau triphasé
U=400;
f=50;


%% Qualité de signal de Batterie (Filtre)
L_Bat = 2e-3;
C_Bat = 1e-3;


%% Boucle de courant batterie niveau 1
kp_Ibat = 6.28; 
ki_Ibat = 550; 


%% Boucle de courant batterie niveau 2
kp_Vbat = 0.2; 
ki_Vbat = 20; 


disp('Parametres chargés.');