% CONFIGURE PHAGOSIGHT
% Adding PhagoSight to your Matlab path. Navigat to the PhagoSight
% folder on Matlab and run this script. It will add the `CODE/` folder
% to the MAtlab path.
%
clc;
PHAGOHOME = pwd;
addpath(fullfile(PHAGOHOME, 'CODE'));

disp('PhagoSight configured. Type "help neutrophilAnalysis" to start.');
disp('If you would like to add PhagoSight permanently to your MATLAB ');
disp('path, consider adding the following line to the startup.m file ');
disp('inside your MATLAB folder[1]:');
fprintf('\n\t addpath(%s);\n\n', fullfile(PHAGOHOME, 'CODE'));
disp('Otherwise, just run the configurePhagosight.m file in the command');
disp('line everytime you want to use the software. Just type the following:');
fprintf('\n >> configurePhagosight;\n\n');
fprintf('Choose the way that suits your workflow better.\n');
disp('_____________________');
disp('[1] Depending on your OS, is the location of the MATLAB folder, but');
disp('    for example:');
disp('    - macOS: /Users/username/Documents/MATLAB');
disp('    - linux: /home/username/Documents/MATLAB');
