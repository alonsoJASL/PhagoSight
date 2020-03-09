% CONFIGURE PHAGOSIGHT
% Adding PhagoSight to your Matlab path. Navigat to the PhagoSight
% folder on Matlab and run this script. It will add the `CODE/` folder
% to the MAtlab path.
%

PHAGOHOME = pwd;
addpath(fullfile(PHAGOHOME, CODE));

disp('PhagoSight configured. Type "help neutrophilAnalysis" to start.');
