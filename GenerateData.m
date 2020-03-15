function GenerateData()
    Hcg= [9.6017627430441588e-01 -1.4000791491288217e-01  2.4178359337357538e-01 10
          1.8663936102599513e-01  9.6539227027881935e-01 -1.8216342498348895e-01  0
         -2.0791169081775931e-01 2.2003533408899148e-01   9.5307774109652066e-01  0
          0 0 0 1]
      
    m_DataCount = 50;
    m_Length = 1280;
    m_Width = 960;
    
    m_GT_Data_P_sensor = zeros(4,m_DataCount);
    m_GT_Data_P_tcp = zeros(4,m_DataCount);
    m_u = zeros(1,m_DataCount);
    m_v = zeros(1,m_DataCount);
    
    for i = 1:m_DataCount
        c = fix(m_Length*rand(1));
        r = fix(m_Width*rand(1));
        m_u(i) = c;
 	    m_v(i) = r;
        [X,Y,Z] = GetPoint3D(m_u(i), m_v(i));
        P = [X;Y;Z;1];
        Q = Hcg * P;
        Q = Q/Q(4);
        m_GT_Data_P_sensor(1,i) = X;
        m_GT_Data_P_sensor(2,i) = Y;
        m_GT_Data_P_sensor(3,i) = Z;
        m_GT_Data_P_sensor(4,i) = 1;
        
        m_GT_Data_P_tcp(1,i) = Q(1);
        m_GT_Data_P_tcp(2,i) = Q(2);
        m_GT_Data_P_tcp(3,i) = Q(3);
        m_GT_Data_P_tcp(4,i) = 1 ;
    end
    
    save('U.mat', 'm_u');
    save('V.mat', 'm_v');
    
    save('m_GT_Data_P_sensor.mat', 'm_GT_Data_P_sensor');
    save('m_GT_Data_P_tcp.mat', 'm_GT_Data_P_tcp');
