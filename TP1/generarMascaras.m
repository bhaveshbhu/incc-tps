function [m1,m2,m3,m4,m5] = generarMascaras(cantBurbujas)

        var1= 3; %3p
        var2= 16; %6p
        var3= 50;%12p
        var4= 100;%24p
        var5= 440;%48p

        m1(1:256,1:256) = 0;
        size = 16;
        b = getBubble(size,var1);
        for i=1:cantBurbujas*2
            x = uint16(rand(1)*64)+96;
            y = uint16(rand(1)*64)+96;
            desdex = max(x - size / 2,0);
            hastax = min(x + size / 2 - 1,256);
            desdey = max(y - size / 2,0);
            hastay = min(y + size / 2 - 1,256);
            m1(desdex:hastax,desdey:hastay) = m1(desdex:hastax,desdey:hastay) + b(1:hastax-desdex+1,1:hastay-desdey+1);
            m1 = min(ones(256),m1);
        end
        %superficie = sum(sum(max(m1,ones(256)*.001)));
        %superficie
        %pgmWrite(m1, 'm1.pgm');

        m2(1:256,1:256) = 0;
        size = 32;
        b = getBubble(size,var2);
        for i=1:round(cantBurbujas/2)
            x = uint16(rand(1)*64)+96;
            y = uint16(rand(1)*64)+96;
            desdex = max(x - size / 2,0);
            hastax = min(x + size / 2 - 1,256);
            desdey = max(y - size / 2,0);
            hastay = min(y + size / 2 - 1,256);
            m2(desdex:hastax,desdey:hastay) = m2(desdex:hastax,desdey:hastay) + b(1:hastax-desdex+1,1:hastay-desdey+1);
            m2 = min(ones(256),m2);
        end

        %sum(sum(max(m2,ones(256)*.001)))

        %pgmWrite(m2, 'm2.pgm');

        m3(1:256,1:256) = 0;
        size = 64;
        b = getBubble(size,var3);
        for i=1:round(cantBurbujas/4)
            x = uint16(rand(1)*64)+96;
            y = uint16(rand(1)*64)+96;
            desdex = max(x - size / 2,0);
            hastax = min(x + size / 2 - 1,256);
            desdey = max(y - size / 2,0);
            hastay = min(y + size / 2 - 1,256);
            m3(desdex:hastax,desdey:hastay) = m3(desdex:hastax,desdey:hastay) + b(1:hastax-desdex+1,1:hastay-desdey+1);
            m3 = min(ones(256),m3);
        end

        %sum(sum(max(m3,ones(256)*.001)))
        %pgmWrite(m3, 'm3.pgm');

        m4(1:256,1:256) = 0;
        size = 128;
        b = getBubble(size,var4);
        for i=1:round(cantBurbujas/8)
            x = uint16(rand(1)*64)+96;
            y = uint16(rand(1)*64)+96;
            desdex = max(x - size / 2,0);
            hastax = min(x + size / 2 - 1,256);
            desdey = max(y - size / 2,0);
            hastay = min(y + size / 2 - 1,256);
            m4(desdex:hastax,desdey:hastay) = m4(desdex:hastax,desdey:hastay) + b(1:hastax-desdex+1,1:hastay-desdey+1);
            m4 = min(ones(256),m4);
        end

        %sum(sum(max(m4,ones(256)*.001)))
        %pgmWrite(m4, 'm4.pgm');

        m5(1:256,1:256) = 0;
        size = 96*2-2;
        b = getBubble(size,var5);
        for i=1:round(cantBurbujas/16)
            x = uint16(rand(1)*64)+96;
            y = uint16(rand(1)*64)+96;
            desdex = max(x - size / 2,0);
            hastax = min(x + size / 2 - 1,256);
            desdey = max(y - size / 2,0);
            hastay = min(y + size / 2 - 1,256);
            m5(desdex:hastax,desdey:hastay) = m5(desdex:hastax,desdey:hastay) + b(1:hastax-desdex+1,1:hastay-desdey+1);
            m5 = min(ones(256),m5);
        end

        %sum(sum(max(m5,ones(256)*.001)))
        %pgmWrite(m5, 'm5.pgm');
        
        %aplanar
%         m1 = m1 * .8 + 1.2;
%         m2 = m2 * .8 + 1.2;
%         m3 = m3 * .8 + 1.2;
%         m4 = m4 * .8 + 1.2;
%         m5 = m5 * .8 + 1.2;
end
