
n=('A_01.jpgA_02.jpgA_03.jpgA_04.jpgA_05.jpgA_06.jpgA_07.jpgA_08.jpgA_09.jpgA_10.jpgA_11.jpgA_12.jpgA_13.jpgA_14.jpgA_15.jpgA_16.jpgA_17.jpgB_01.jpgB_02.jpgB_03.jpgB_04.jpgB_05.jpgB_06.jpgB_07.jpgB_08.jpgB_09.jpgB_10.jpgB_11.jpgB_12.jpgB_13.jpgB_14.jpgB_15.jpgB_16.jpgB_17.jpgC_01.jpgC_02.jpgC_03.jpgC_04.jpgC_05.jpgC_06.jpgC_07.jpgC_08.jpgC_09.jpgC_10.jpgC_11.jpgC_12.jpgC_13.jpgC_14.jpgC_15.jpgC_16.jpgC_17.jpgD_01.jpgD_02.jpgD_03.jpgD_04.jpgD_05.jpgD_06.jpgD_07.jpgD_08.jpgD_09.jpgD_10.jpgD_11.jpgD_12.jpgD_13.jpgD_14.jpgD_15.jpgD_16.jpgD_17.jpgE_01.jpgE_02.jpgE_03.jpgE_04.jpgE_05.jpgE_06.jpgE_07.jpgE_08.jpgE_09.jpgE_10.jpgE_11.jpgE_12.jpgE_13.jpgE_14.jpgE_15.jpgE_16.jpgE_17.jpgPatro1.jpgPatro2.jpgPatro3.jpgPatro4.jpg')
total=zeros(480,640);
distancia=zeros(480,640);
s=1;
for t=1:17;                      %Leo unicamente la ultima fila de puntos.
    imagen=imread(n(s:s+7));
    s=s+8;
    imagen=im2bw(imagen);
    total=total+imagen;
end;
s=681;
for t=1:4;     %Leo los patrones
    imagen=imread(n(s:s+9));
    s=s+10;
    imagen=im2bw(imagen);
    total=total+imagen;
end;

for i=240:300;        %Busco la columna del patron
    for j=310:330;
        if total(i,j)==1;
            centro=j;
        end;
    end;
end;
i=1;
for i=1:640;
    for k=1:480;     %Busco la columna del primer pixel de la ultima fila y lugo lo resto para establecer la relacion pixel-distancia.
        if total(k,i)==1;
            lado=i;
            fila=k;
            k=480;
            i=640;
            numpixel=lado-centro;
            relacion=6.32/numpixel;  %Asi quedara cm/pixel
        end;
    end;
end;

total=zeros(480,640);   %Vuelvo a poner en blanco la matriz.
s=1;
for t=1:17;                      %Leo unicamente la ultima fila de puntos.
    imagen=imread(n(s:s+7));
    s=s+8;
    imagen=im2bw(imagen);
    total=total+imagen;
end;
s=1;
t=1;
for s=1:640;    %Busco en la ultima fila donde hay puntos en blanco lo comparo por la fila que esta en el fondo y la diferencia la paso a cm.
    for t=1:480;
        if total(t,s)==1;
            dis=t-fila;
            dis=dis*relacion;   % lo paso a cm
            distancia(fila,s)=dis;
        end;
    end;
end;

s=137;

    total=zeros(480,640);   %Vuelvo a poner en blanco la matriz.
    
    for t=1:17;                      %Leo unicamente la ultima fila de puntos.
        imagen=imread(n(s:s+7));
        s=s+8;
        imagen=im2bw(imagen);
        total=total+imagen;
    end;
    i=1;
    k=1;
    for i=1:640;
        for k=1:480;     %Busco la fila del primer pixel de la penultima fila.
            if total(k,i)==1;
                fila=k;
                k=480;
                i=640;
            end;
        end;
    end;
    for g=1:640;    %Busco en la ultima fila donde hay puntos en blanco lo comparo por la fila que esta en el fondo y la diferencia la paso a cm.
        for t=1:480;
            if total(t,g)==1;
                dis=t-fila;
                dis=dis*relacion;   % lo paso a cm
               dis2=(sin((pi-atan2(17,45))/2)*dis)/sin(atan2(17,45));  
                distancia(fila,g)=dis;
            end;
        end;
    end;
    s=409;
   for b=1:2;
        total=zeros(480,640);   %Vuelvo a poner en blanco la matriz.
    
    for t=1:17;                      
        imagen=imread(n(s:s+7));
        s=s+8;
        imagen=im2bw(imagen);
        total=total+imagen;
    end;
    i=1;
    k=1;
    for i=1:640;
        for k=1:480;     
            if total(k,i)==1;
                
                fila=k;
                k=480;
                i=640;
            end;
        end;
    end;
    for g=1:640;    %Busco en donde hay puntos en blanco lo comparo por la fila que esta en el fondo y la diferencia la paso a cm.
        for t=1:480;
            if total(t,g)==1;
                dis=t-fila;
                dis=dis*relacion;   % lo paso a cm
                distancia(fila,g)=dis;
            end;
        end;
    end;
    
end;
m=0;
for i=1:480;
    for j=1:640;
        if distancia(i,j)~=0;
            m=m+1;
        end;
    end;
end;

x=zeros(m,4);   %Separamos las coordenadas x, y, z en trs matrices diferentes
y=zeros(m,4);
z=zeros(m,4);
m=1;
for i=50:100;
    for j=200:640;
        if distancia(i,j)~=0;
            z(m,1)=distancia(i,j);
            y(m,1)=i;
            x(m,1)=j;
            m=m+1;
        end;
    end;
end;

m=1;
for i=100:150;
    for j=200:640;
        if distancia(i,j)~=0;
            z(m,2)=distancia(i,j);
            y(m,2)=i;
            x(m,2)=j;
            m=m+1;
        end;
    end;
end;
m=1;
for i=200:250;
    for j=200:640;
        if distancia(i,j)~=0;
            z(m,3)=distancia(i,j);
            y(m,3)=i;
            x(m,3)=j;
            m=m+1;
        end;
    end;
end;
m=1;
for i=250:350;
    for j=200:640;
        if distancia(i,j)~=0;
            z(m,4)=distancia(i,j);
            y(m,4)=i;
            x(m,4)=j;
            m=m+1;
        end;
    end;
end;

i=1;
for i=1:204;     %Aplicamos la formulacion para que las distancias nos den correctas.
    if y(i,1)~=0;
        
        y(i,1)=y(i,1)*relacion;
    end;
    if x(i,1)~=0;
        
        x(i,1)=x(i,1)*relacion;
    end;
end;
i=1;
for i=1:204;
    if y(i,2)~=0;
         
         y(i,2)=y(i,2)*relacion;
    end;
    if x(i,2)~=0;
       
       x(i,2)=x(i,2)*relacion;
    end;
end;
 i=1;
for i=1:204;
    if y(i,3)~=0;
     
        y(i,3)=y(i,3)*relacion;
    end;
    if x(i,3)~=0;
       
        x(i,3)=x(i,3)*relacion;
    end;
end;       
i=1;
for i=1:204;
    if y(i,4)~=0;
         
         y(i,4)=y(i,4)*relacion;
    end;
    if x(i,4)~=0;
      
         x(i,4)=x(i,4)*relacion;
    end;
end;       
i=1;
j=1;
x1=zeros(47,4);
y1=zeros(47,4);
z1=zeros(47,4);
for i=1:4;
    for j=1:47;
        x1(j,i)=x(j,i);
        y1(j,i)=y(j,i);
        z1(j,i)=z(j,i);
    end;
end;

S = [1,2,1]

surfl(x1,y1,z1,S);
