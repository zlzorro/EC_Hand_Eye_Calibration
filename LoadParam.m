function [StripePlanar, Camera_Matrix]= LoadParam()
%      StripePlanar =[5.0082788702756362e-04  8.1241746429215351e-03 -6.6045958694656319e-03 9.9994506162648755e-01];
%      Camera_Matrix =[1.2949362332743660e+03 0                      6.3950000000000000e+02  0; 
%                      0                      1.2949362332743660e+03 4.7950000000000000e+02  0; 
%                      0                      0                      1                       0]
%                  
%      save('StripePlanar.mat', 'StripePlanar');
%      save('Camera_Matrix.mat', 'Camera_Matrix');
     load('StripePlanar.mat');
     load('Camera_Matrix.mat');
    global m_L1;
    global m_L2;
    global m_L3;
    global m_L4;
    global m_L5;
    global m_L6;
    global m_L7;
    global m_L8;
    global m_L9;
    global m_L10;
    global m_L11;
    global m_L12;
    global m_dLPA;
    global m_dLPB;
    global m_dLPC;
    global m_dLPD;
    m_L1 = Camera_Matrix(1, 1);
	m_L2 = Camera_Matrix(1, 2);
	m_L3 = Camera_Matrix(1, 3);
	m_L4 = Camera_Matrix(1, 4);

	m_L5 = Camera_Matrix(2, 1);
	m_L6 = Camera_Matrix(2, 2);
	m_L7 = Camera_Matrix(2, 3);
	m_L8 = Camera_Matrix(2, 4);

	m_L9 = Camera_Matrix(3, 1);
	m_L10 = Camera_Matrix(3, 2);
	m_L11 = Camera_Matrix(3, 3);
	m_L12 = Camera_Matrix(3, 4);
    
    m_dLPA = StripePlanar(1);
    m_dLPB = StripePlanar(2);
    m_dLPC = StripePlanar(3);
    m_dLPD = StripePlanar(4);
     
   

	