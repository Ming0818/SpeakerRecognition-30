function v =  mfcc(s,fs)
v = [];

for i = 1:floor(0.03*fs/10):length(s)-0.03*fs
    
    segment = s(i:i+0.03*fs);
    
    f = fft(segment);
    m = melfb(30, length(segment), fs);
    n2 = 1 + floor(length(segment)/2);
    z = m * abs(f(1:n2)).^2;
    c = dct(log(z));
    v(:,end+1) = c;
end

v(1,:) = [];

end