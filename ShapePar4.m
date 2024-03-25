function [TV, TV0, TV1, TV2, TV3, TV4, xmin, xmax]=ShapePar4(x)
%function calculating for the vector x its TV, TV0, TV1, TV2, TV3 and TV4
%Version 210309
%to enable logplot, TV values are limited to minimum 1e-20
%xmin1=xmin, xmax1=xmax,x0=x(1),xoo=x(xsizem)
%not 100% sure that it works correctly for x0=xoo - in that case it should
%identify the first extreme point - max, or min by comparing ixmax, ixmin
[xsizem, ~] = size(x);
x0=x(1);xoo=x(xsizem);

[xmax, ixmax]= max(x);
[xmin, ixmin]= min(x);			

TV= sum(abs(diff(x))); 
TV0= TV-abs(xoo-x0);
if (TV0<=0) TV0=1e-20; end
%if (xoo<x0) 
if ((ixmax==1)||(ixmin<ixmax)&&(ixmin>1))
    TV1= TV-abs(2*xmin-xoo-x0);
    if (TV1<=0) TV1=1e-20; end %#ok<SEPEX>
    x2=x(ixmin:xsizem);
    [xmax, ixmax]= max(x2);
    TV2= TV-abs(2*xmax-2*xmin-xoo+x0);if (TV2<=0) TV2=1e-20; end
    x3=x(ixmin+ixmax:xsizem);
    [xmin2, ixmin2]= min(x3);
    TV3= TV-abs(2*xmax-2*xmin-2*xmin2+xoo+x0);
    if (TV3<=0) TV3=1e-20; end 
    if (ixmin+ixmax+ixmin2<xsizem)
        x4=x(ixmin+ixmax+ixmin2:xsizem);
        [xmax2, ~]= max(x4);
    else
        xmax2=xoo;
    end
    TV4= TV-abs(2*xmax+2*xmax2-2*xmin-2*xmin2-xoo+x0);
    if (TV4<=0) TV4=1e-20; end    
else
    TV1= TV-abs(2*xmax-xoo-x0);
    if (TV1<=0) TV1=1e-20; end
    x2=x(ixmax:xsizem);
    [xmin, ixmin]= min(x2);
    TV2= TV-abs(2*xmax-2*xmin+xoo-x0);if (TV2<=0) TV2=1e-20; end
    x3=x(ixmax+ixmin:xsizem);
    [xmax2, ixmax2]= max(x3);
    TV3= TV-abs(2*xmax-2*xmin+2*xmax2-xoo-x0);
    if (TV3<=0) TV3=1e-20; end 
    if (ixmax+ixmin+ixmax2<xsizem)
        x4=x(ixmax+ixmin+ixmax2:xsizem);
        [xmin2, ~]= min(x4);
    else
        xmin2=xoo;
    end
    TV4= TV-abs(2*xmax+2*xmax2-2*xmin-2*xmin2+xoo-x0);
    if (TV4<=0) TV4=1e-20; end
end    

end
