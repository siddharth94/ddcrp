function [nb]=nbrhood(row,col)
% clc;
% 
% row=4;
% col=3;
% mat=randi(255,row,col);
% 
% [row,col]=size(mat);
% remat=reshape(mat,row*col,1);

nb=cell(row*col,1);

for i=1:row*col
    r=mod(i,row);
    c=floor(i/row)+1;
    
    if (r==0)
        r=r+row;
        c=c-1;
    end

    n1=[r,c-1];
    n2=[r-1,c];
    n3=[r+1,c];
    n4=[r,c+1];
    
        if (r==1)
            if (c==1)
                nb{i}=[r+1,row+1];
            elseif (c==col)
                nb{i}=[row*(c-2)+r,row*(c-1)+r+1];
            else
                nb{i}=[n1(1)+(n1(2)-1)*row,n3(1)+(n3(2)-1)*row,n4(1)+(n4(2)-1)*row];
            end
        elseif (r==row)
            if (c==1)
                nb{i}=[row-1,2*row];
            elseif (c==col)
                nb{i}=[row*col-row,row*col-1];
            else
                nb{i}=[n1(1)+(n1(2)-1)*row,n2(1)+(n2(2)-1)*row,n4(1)+(n4(2)-1)*row];       
            end
        elseif (c==1)
            if (r>1 && r<row )
               nb{i}=[n2(1)+(n2(2)-1)*row,n3(1)+(n3(2)-1)*row,n4(1)+(n4(2)-1)*row];
            end
        elseif (c==col)
            if (r>1 && r<row )
                nb{i}=[n1(1)+(n1(2)-1)*row,n2(1)+(n2(2)-1)*row,n3(1)+(n3(2)-1)*row];
            end  
        else
            nb{i}=[n1(1)+(n1(2)-1)*row,n2(1)+(n2(2)-1)*row,n3(1)+(n3(2)-1)*row,n4(1)+(n4(2)-1)*row];         
        end
    
    
end



