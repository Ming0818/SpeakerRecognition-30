function c = vqlbg(v,k)
[i,c] = kmeans(v,k);
c= c';
end