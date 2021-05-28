function C = LoopRowMove(A)
[m,n] = size(A);
C = zero(m, m+n-1);
for k = 1:m
    C(k,k:k+n-1)=A(k,:);
end
