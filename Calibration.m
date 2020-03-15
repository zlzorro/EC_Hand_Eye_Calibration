% Error Correctable Hand-Eye Calibration for Stripe-Laser Vision-Guided Robotics
%
% Authors: Liang Zhang, Jian-Zhou Zhang, XiaoYi Jiang, Biao Liang
% e-mail: lzhangcv@outlook.com

function H = Calibration()
    %GenerateData();
    [StripePlanar, Camera_Matrix]= LoadParam();
    load('U.mat');
    load('V.mat');
    load('m_GT_Data_P_tcp.mat');
    [r, DataCount] = size(m_u);
    TrainPro = 0.5;
    TrainCount = DataCount * TrainPro;
    ValidationCount = DataCount - TrainCount;
    Data_P_senor = zeros(4, DataCount);
    for i = 1: DataCount
        [X,Y,Z] = GetPoint3D(m_u(i), m_v(i));
        Data_P_senor(1,i) = X;
        Data_P_senor(2,i) = Y;
        Data_P_senor(3,i) = Z;
        Data_P_senor(4,i) = 1;
    end
    Train_P_sensor = Data_P_senor(:, 1:TrainCount);
    Train_P_tcp = m_GT_Data_P_tcp(:, 1:TrainCount);
    Validation_P_sensor = Data_P_senor(:, TrainCount+1:DataCount);
    Validation_P_tcp = m_GT_Data_P_tcp(:, TrainCount+1:DataCount);
    Estimated_P_tcp = zeros(4, ValidationCount);
    H = GetCoefficientMatrix(Train_P_sensor,Train_P_tcp);
    
    err = 0;
    for i = 1: ValidationCount
        P = Validation_P_sensor(:, i);
        Q = Validation_P_tcp(:, i);
        Qe = H * P;
        Qe = Qe/Qe(4);
        Estimated_P_tcp(:,i) = Qe;
        dist = sqrt(( Q(1)-Qe(1) )^2 + ( Q(2)-Qe(2) )^2 + ( Q(3)-Qe(3) )^2);
        err = err + dist;
    end
    err = err / ValidationCount;
    
    x1 = Validation_P_sensor(1,:);
    y1 = Validation_P_sensor(2,:);
    z1 = Validation_P_sensor(3,:);
    h1 = scatter3(x1,y1,z1,20,[1 0 0],'filled');

    hold on;

    x2 = Validation_P_tcp(1,:);
    y2 = Validation_P_tcp(2,:);
    z2 = Validation_P_tcp(3,:);
    h2 = scatter3(x2,y2,z2,20,[0 1 0],'filled');

    hold on;
    x3 = Estimated_P_tcp(1,:);
    y3 = Estimated_P_tcp(2,:);
    z3 = Estimated_P_tcp(3,:);
    h3 = scatter3(x3,y3,z3,20,[0 0 1],'*');
    xlabel('x'),ylabel('y'),zlabel('z');
    
    hstruct = get(h1);
    legend(hstruct.Children, 'Ps', 'Pt', 'Hst*Ps');
    