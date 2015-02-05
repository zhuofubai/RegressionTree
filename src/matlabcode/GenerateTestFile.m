clear
Test_T = [];
Test_T_Plus=[];
for i=1:150
    outdata = ['outdata',num2str(i)];
    load(outdata);
    dataNum=length(pos1);
    SampleSize=fix(dataNum/10);
    sampleind = randperm(dataNum-1);
    sampleind = sampleind(1: SampleSize);
    sampleind = sort(sampleind);
%     sampleind_tplus=sampleind+1;
%     temp_Sample_T=zeros(SampleSize,47);
%     temp_Sample_T_Plus=zeros(SampleSize,47);        
    temp_Sample_T = getdata(sampleind,outdata);
    temp_Sample_T_Plus = getdata(sampleind+1,outdata); 
    
    Test_T = [Test_T; temp_Sample_T];
    Test_T_Plus=[Test_T_Plus; temp_Sample_T_Plus];
end

fid1 = fopen('Test_T.txt','w');
fid2 = fopen('Test_T_Plus.txt','w');
for k = 1: size(Test_T, 1)
fprintf(fid1, '%f ', Test_T(k,:));
fprintf(fid1, '\n');
fprintf(fid2, '%f ', Test_T_Plus(k,:));
fprintf(fid1, '\n');
end
fclose(fid1);
fclose(fid2);
savefile = 'Test_T.mat';
save(savefile, 'Test_T');
savefile = 'Test_T_Plus.mat';
save(savefile, 'Test_T_Plus');