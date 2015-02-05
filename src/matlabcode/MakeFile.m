% [time  actual_back, actual_Front, actual_Needle_Tip_Position, actual_R
%        err1, err2, err3, err4, err5, pos1, pos2, pos3, pos4, pos5
%        ref_Back, ref_Front, ref_Needle_Tip_Position, ref_R
%        torq1 torq2 torq3 torq4 torq5 
%        insertdist, pinsert, rinsert]%
clear
Sample_T = [];
Sample_T_Plus=[];
for i=1:15
    outdata = ['outdata',num2str(i)];
    load(outdata);
    dataNum=length(pos1);
    SampleSize=fix(dataNum/15);
    sampleind = randperm(dataNum-10);
    sampleind = sampleind(1: SampleSize);
    sampleind = sort(sampleind);
%     sampleind_tplus=sampleind+1;
%     temp_Sample_T=zeros(SampleSize,47);
%     temp_Sample_T_Plus=zeros(SampleSize,47);        
    temp_Sample_T = getdata(sampleind,outdata);
    temp_Sample_T_Plus = getdata(sampleind+10,outdata); 
    
    Sample_T = [Sample_T; temp_Sample_T];
    Sample_T_Plus=[Sample_T_Plus; temp_Sample_T_Plus];
end

fid1 = fopen('Sample_T.txt','w');
fid2 = fopen('Sample_T_Plus.txt','w');
for k = 1: size(Sample_T, 1)
fprintf(fid1, '%f ', Sample_T(k,:));
fprintf(fid1, '\n');
fprintf(fid2, '%f ', Sample_T_Plus(k,:));
fprintf(fid1, '\n');
end
fclose(fid1);
fclose(fid2);
savefile = 'Sample_T.mat';
save(savefile, 'Sample_T');
savefile = 'Sample_T_Plus.mat';
save(savefile, 'Sample_T_Plus');
