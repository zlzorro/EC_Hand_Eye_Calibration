function [X,Y,Z] = GetPoint3D(U,V)
    
    
%     m_L1 = 1294.9362332743660;
%     m_L2 = 0.00000000000000000;
%     m_L3 = 639.50000000000000;
%     m_L4 = 0.00000000000000000;
%     m_L5 = 0.00000000000000000;
%     m_L6 = 1294.9362332743660;
%     m_L7 = 479.50000000000000;
%     m_L8 = 0.00000000000000000;
%     m_L9 = 0.00000000000000000;
%     m_L10 = 0.00000000000000000;
%     m_L11 = 1.0000000000000000;
%     m_L12 = 0.00000000000000000;
%     m_dLPA = 0.00050082788702756362;
%     m_dLPB = 0.0081241746429215351;
%     m_dLPC = -0.0066045958694656319;
%     m_dLPD = 0.99994506162648755;
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
    
    m_A = zeros(3,3);
    m_b = zeros(3,1);
    m_A(1, 1) = U * m_L9 - m_L1;
	m_A(1, 2) = U * m_L10 - m_L2;
	m_A(1, 3) = U * m_L11 - m_L3;

	m_A(2, 1) = V * m_L9 - m_L5;
	m_A(2, 2) = V * m_L10 - m_L6;
	m_A(2, 3) = V * m_L11 - m_L7;

	m_A(3, 1) = m_dLPA;
	m_A(3, 2) = m_dLPB;
	m_A(3, 3) = m_dLPC;

	m_b(1) = m_L4 - U;
	m_b(2) = m_L8 - V;
	m_b(3) = -m_dLPD;

	m_invA = inv(m_A);
	m_X = m_invA * m_b;


	X = m_X(1);
	Y = m_X(2);
	Z = m_X(3);